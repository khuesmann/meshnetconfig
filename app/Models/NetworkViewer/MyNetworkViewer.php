<?php
/**
 * Created by PhpStorm.
 * User: karim
 * Date: 6/14/16
 * Time: 11:12 AM
 */

namespace App\Models\NetworkViewer;


use App\Models\Experiment;
use App\Models\XMLParser;

class MyNetworkViewer implements MeshNetVInterface
{

    /*** @var XMLParser */
    private $xmlParser;

    /*** @var Experiment */
    private $experiment;

    /**
     * This implementation of a NetworkViewer takes an Experiment to get the XML path and mappings from
     *
     * MyNetworkViewer constructor.
     * @param Experiment $experiment
     */
    public function __construct(Experiment $experiment)
    {
        ini_set('memory_limit', "2048M");
        ini_set('upload_max_filesize', "200M");
        ini_set('post_max_size', "200M");
        ini_set('max_execution_time', 60000);
        ini_set('max_input_time', 60000);
        $this->experiment = $experiment;
        $this->xmlParser = new XMLParser($experiment->raw_experiment);
    }

    /**
     * @return array
     */
    public function getScanResults()
    {
        $scanResultMapping = $this->experiment->mapping->getScanResultMapping();
        return $this->xmlParser->parse($scanResultMapping);
    }

    /**
     * @return array
     */
    public function getScanResultExample()
    {
        $scanResults = $this->getScanResults();
        return array_shift($scanResults);
    }

    /**
     * @return array
     */
    public function getResults()
    {
        $resultMapping = $this->experiment->mapping->getResultMapping();
        return $this->xmlParser->parse($resultMapping);
    }

    /**
     * @return array
     */
    public function getResultExample()
    {
        $results = $this->getResults();
        return array_shift($results);
    }

    /**
     * @return array
     */
    public function getGeneralInformation()
    {
        $generalInformation = $this->experiment->mapping->getGeneralInformationMapping();
        return $this->xmlParser->parse($generalInformation);
    }

    /**
     * @return array
     */
    public function getNodes()
    {
        $nodes = $this->experiment->mapping->getNodeMapping();
        $parsedNodes = $this->xmlParser->parse($nodes);
        foreach($parsedNodes as &$node) {
            $node['hidden'] = false;
        }
        return array_values($parsedNodes);
    }

    /**
     * @return array
     */
    public function getAllInformation()
    {
        $allInformation = [
            "general" => $this->getGeneralInformation(),
            "nodes" => $this->getNodes(),
            "results" => $this->getResults(),
            "scan_results" => $this->getScanResults(),
            "metrics" => [
                'results' => $this->getPossibleResultMetrics(),
                'scan_results' => $this->getPossibleScanResultMetrics()
            ]
        ];
        return $allInformation;
    }

    /**
     * @return array
     */
    public function getPossibleResultMetrics()
    {
        $possibleMetrics = [];
        $results = $this->getResults();
        foreach($results as $result) {
            $possibleMetrics = array_unique(array_merge($possibleMetrics, array_keys((array) json_decode($result["result"]))));
        }
        return $possibleMetrics;
    }

    /**
     * @return array
     */
    public function getPossibleScanResultMetrics()
    {
        $possibleMetrics = [];
        $scanResults = $this->getScanResults();
        foreach($scanResults as $scanResult) {
            $possibleMetrics = array_unique(array_merge($possibleMetrics, array_keys((array) json_decode($scanResult["result"]))));
        }
        return $possibleMetrics;
    }
}