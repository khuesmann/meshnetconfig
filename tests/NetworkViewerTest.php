<?php
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;

/**
 * Created by PhpStorm.
 * User: karim
 * Date: 11/11/16
 * Time: 1:36 AM
 */
class NetworkViewerTest extends TestCase
{
    use DatabaseTransactions;

    private $experimentData;
    private $mapping;
    private $experiment;

    public function testAnalysis()
    {
        $xmlPath = base_path("tests/assets/test1.xml");
        $this->mapping = $this->getMapping();
        $this->experiment = \App\Models\Experiment::create(['name' => 'test', 'mapping_id' => $this->mapping->id, 'analysis' => null, 'config' => null, 'raw_experiment' => $xmlPath]);
        $experimentInformation = $this->experiment->analyze();

        $this->assertArrayHasKey('general', $experimentInformation);
        $this->assertArrayHasKey('nodes', $experimentInformation);
        $this->assertArrayHasKey('results', $experimentInformation);
        $this->assertArrayHasKey('scan_results', $experimentInformation);
        $this->assertArrayHasKey('metrics', $experimentInformation);

        if (array_key_exists("general", $experimentInformation)) {
            $this->hasGeneralInformation($experimentInformation['general']);
        }

        if (array_key_exists("nodes", $experimentInformation)) {
            $this->hasNodes($experimentInformation['nodes']);
        }

        if (array_key_exists("results", $experimentInformation)) {
            $this->hasResults($experimentInformation['results']);
        }

        if (array_key_exists("scan_results", $experimentInformation)) {
            $this->hasScanResults($experimentInformation['scan_results']);
        }

        if (array_key_exists("metrics", $experimentInformation)) {
            $this->hasMetrics($experimentInformation['metrics']);
        }
    }

    public function hasGeneralInformation($generalInformation)
    {
        foreach ($generalInformation as $generalInfo) {
            $this->assertArrayHasKey('description', $generalInfo);
            $this->assertArrayHasKey('name', $generalInfo);
            if (array_key_exists("name", $generalInfo)) {
                $this->assertEquals('Testcase Experiment XML', $generalInfo['name']);
            }
            if (array_key_exists("description", $generalInfo)) {
                $this->assertEquals('test', $generalInfo['description']);
            }
        }
    }

    public function hasNodes($nodes)
    {
        $this->assertEquals(45, count($nodes));
        if (array_key_exists(8, $nodes)) {
            $node = $nodes[8];
            $this->assertEquals('test', $node['name']);
            $this->assertEquals('test', $node['level']);
            $this->assertEquals('test', $node['building']);
            $this->assertEquals('test', $node['locationX']);
            $this->assertEquals('test', $node['locationY']);
            $this->assertEquals('test', $node['locationZ']);
            $this->assertEquals('test', $node['nodeType']);

            $this->assertEquals(4, count($node['ipv4Addresses']));
            $this->assertEquals('test', $node['ipv4Addresses'][0]);
            $this->assertEquals('test', $node['ipv4Addresses'][1]);
            $this->assertEquals('test', $node['ipv4Addresses'][2]);
            $this->assertEquals('test', $node['ipv4Addresses'][3]);

            $this->assertEquals(4, count($node['macAddresses']));
            $this->assertEquals('test', $node['macAddresses'][0]);
            $this->assertEquals('test', $node['macAddresses'][1]);
            $this->assertEquals('test', $node['macAddresses'][2]);
            $this->assertEquals('test', $node['macAddresses'][3]);

            $this->assertEquals('MIOTTestbed', $node['testbedName']);
            $this->assertEquals(false, $node['hidden']);
        }
    }

    public function hasResults($results)
    {
        $this->assertEquals(1025, count($results));

        $result = $results[1];

        $this->assertEquals('test', $result['nodeId']);
        $this->assertEquals('test', $result['invocationId']);
        $this->assertEquals('test', $result['startedAfter']);
        $this->assertEquals('test', $result['endedBefore']);
        $this->assertEquals('test', $result['returnCode']);
        $this->assertEquals('0', $result['actionId']);
        $this->assertEquals('3', $result['actionBlockId']);
        $this->assertEquals(null, $result['variableValues']);
        $this->assertEquals("0", $result['iterationId']);
        $this->assertEquals(17, $result['replicationId']);
        $this->assertEquals("{\"local\":\"test\",\"remote\":\"test\",\"seconds\":\"test\",\"data_val\":\"test\",\"data_unit\":\"test\",\"throughput_val\":\"test\",\"throughput_unit\":\"test\"}", $result['result']);

    }

    public function hasScanResults($scanResults)
    {
        $this->assertEquals(1191, count($scanResults));

        $scanResult = $scanResults[1];
        $this->assertEquals("test", $scanResult['startTime']);
        $this->assertEquals("test", $scanResult['nodeId']);
        $this->assertEquals("test", $scanResult['extractor']);
        $this->assertEquals('{"test": test}}', $scanResult['result']);
    }

    public function hasMetrics($metrics)
    {
        $this->assertArrayHasKey("results", $metrics);
        $this->assertArrayHasKey("scan_results", $metrics);
        $this->assertEquals(["local", "remote", "seconds", "data_val", "data_unit", "throughput_val", "throughput_unit"], $metrics['results']);
        $this->assertEquals([
            0 => "tx_packets",
            1 => "tx_bytes",
            2 => "rx_packets",
            3 => "rx_bytes",
            4 => "collisions",
            5 => "rx_crc_errors",
            6 => "rx_frame_errors",
            7 => "tx_compressed",
            8 => "tx_heartbeat_error",
            9 => "multicast",
            10 => "rx_dropped",
            11 => "rx_length_errors",
            12 => "tx_aborted_errors",
            13 => "tx_dropped",
            14 => "rx_errors",
            15 => "rx_missed_errors",
            16 => "tx_errors",
            17 => "tx_window_errors",
            18 => "rx_compressed",
            19 => "rx_fifo_errors",
            20 => "rx_over_errors",
            21 => "tx_carrier_errors",
            22 => "tx_fifo_errors",
            23 => "node_id",
            24 => "nw_interface_name",
            25 => "nw_interface_id"
        ], $metrics['scan_results']);
    }

    public function getMapping()
    {
        $nodeMapping = [
            "xpath" => "/experiment/hardware/nodes/node",
            "id" => "@id",
            "variables" => [
                "name" => "@id",
                "level" => "level",
                "building" => "building",
                "room" => "room",
                "locationX" => "locationX",
                "locationY" => "locationY",
                "locationZ" => "locationZ",
                "nodeType" => "nodetype",
                "ipv4Addresses" => "./interfaces/interface/ipv4Address",
                "macAddresses" => "./interfaces/interface/macAddress",
                "testbedName" => "./../../testbeds/@name"
            ]
        ];

        $scanResults = [
            "xpath" => "/experiment/scans/extractor/node/result/result",
            "id" => null,
            "variables" => [
                "result" => ".",
                "startTime" => "../probetime",
                "nodeId" => "../../@name",
                "extractor" => "../../../@name",
            ],
            "relations" => [
//                "nodeId" => "//hardware/nodes/node[@id=##nodeId##]"
            ]
        ];

        $results = [
            "xpath" => "/experiment/results/replication/iteration/action_block/action/invocation/result",
            "id" => null,
            "variables" => [
                "result" => ".",
                "nodeId" => "../node",
                "invocationId" => "parent::invocation/@id",
                "startedAfter" => "parent::invocation/@startedAfter",
                "endedBefore" => "parent::invocation/@endedBefore",
                "returnCode" => "parent::invocation/@returnCode",
                "actionId" => "parent::invocation/parent::action/@id",
                "actionBlockId" => "parent::invocation/parent::action/parent::action_block/@id",
                "variableValues" => "parent::invocation/parent::action/parent::action_block/parent::iteration/variableValues/variableValue",
                "iterationId" => "parent::invocation/parent::action/parent::action_block/parent::iteration/@id",
                "replicationId" => "parent::invocation/parent::action/parent::action_block/parent::iteration/parent::replication/@id",
            ],
            "relations" => [
//                "action" => "//actions/action_block[@id=##actionBlockId##]/action[@id=##actionId##]",
//                "node" => "//hardware/nodes/node[@id=##nodeId##]"
            ]
        ];

        $generalInformation = [
            "xpath" => "/experiment/general",
            "id" => "name",
            "variables" => [
                "name" => "name",
                "description" => "description"
            ]
        ];

        return \App\Models\Mapping::create([
            'name' => "Default Mapping",
            'is_active' => true,
            'result_mapping' => json_encode($results),
            'scan_result_mapping' => json_encode($scanResults),
            'node_mapping' => json_encode($nodeMapping),
            'general_info_mapping' => json_encode($generalInformation)
        ]);
    }
}