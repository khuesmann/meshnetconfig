<?php

use Illuminate\Database\Seeder;

class MappingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
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
        
        \App\Models\Mapping::create([
            'name' => "Default Mapping",
            'is_active' => true,
            'result_mapping' => json_encode($results),
            'scan_result_mapping' => json_encode($scanResults),
            'node_mapping' => json_encode($nodeMapping),
            'general_info_mapping' => json_encode($generalInformation)
        ]);
    }
}
