<?php
/**
 * Created by PhpStorm.
 * User: karim
 * Date: 6/24/16
 * Time: 11:56 PM
 */

namespace App\Models;


class XMLParser
{

    public function __construct($xmlUrl)
    {
        $this->xmlDom = simplexml_load_file($xmlUrl);
    }

    /**
     * @param $mappings
     * @return array
     */
    public function parse($mappings)
    {
        ini_set("max_execution_time", 500);

        $xpath = $mappings['xpath'];
        $variables = key_exists("variables", $mappings) ? $mappings['variables'] : [];
        $relations = key_exists("relations", $mappings) ? $mappings['relations'] : [];

        $xmlElement = $this->xmlDom->xpath($xpath);
        $xmlResults = [];
        $count = 0;
        foreach ($xmlElement as $xml) {
            foreach ($variables as $variable => $mapping) {
                $xmlResults[$count][$variable] = $this->getContentByMapping($xml, $mapping);
            }
            $count++;
        }

        $xmlResults = $this->applyRelations($xmlResults, $relations);

        return array_values($xmlResults);
    }

    /**
     * @param $xmlResults
     * @param $relations
     * @return mixed
     */
    public function applyRelations($xmlResults, $relations)
    {
        foreach ($xmlResults as &$xmlResult) {
            foreach ($relations as $relationName => $mapping) {
                while (strpos($mapping, "##") !== false) {
                    $relationIdentifier = $this->getStringBetween($mapping, "##", "##");
                    $mapping = str_replace("##$relationIdentifier##", "'$xmlResult[$relationIdentifier]'", $mapping);
                }
                $xmlResult[$relationName] = $this->getContentByMapping($this->xmlDom, $mapping);
            }
        }
        return $xmlResults;
    }

    /**
     * @param $string
     * @param $start
     * @param $end
     * @return string
     */
    function getStringBetween($string, $start, $end)
    {
        $string = ' ' . $string;
        $ini = strpos($string, $start);
        if ($ini == 0) return '';
        $ini += strlen($start);
        $len = strpos($string, $end, $ini) - $ini;
        return substr($string, $ini, $len);
    }

    /**
     * @param \SimpleXMLElement $xmlElement
     * @param $mapping
     * @return array|null|string
     */
    public function getContentByMapping(\SimpleXMLElement $xmlElement, $mapping)
    {
        $content = $xmlElement->xpath($mapping);
        if (empty($content)) return null;
        if (count($content) == 1) {
            if($content[0][0]->count() > 1) {
                return $content[0][0];
            }
            else {
                return (string) $content[0][0];
            }
        }
        $finalContent = [];
        foreach($content as $c) {
            $finalContent[] = $c->__toString();
        }
        return $finalContent;
    }

}