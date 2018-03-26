<?php
/**
 * Created by PhpStorm.
 * User: karim
 * Date: 6/26/16
 * Time: 2:25 PM
 */

namespace App\Models\NetworkViewer;


interface MeshNetVInterface
{
    /**
     * return general information from experiment xml
     * @return array
     */
    public function getGeneralInformation();
    
    /**
     * return nodes from experiment xml
     * @return array
     */
    public function getNodes();

    /**
     * return results from experiment xml
     * @return array
     */
    public function getResults();

    /**
     * return an example for a result from experiment xml
     * @return array
     */
    public function getResultExample();

    /**
     * return scan results from experiment xml
     * @return array
     */
    public function getScanResults();

    /**
     * return an example for a scan result from experiment xml
     * @return array
     */
    public function getScanResultExample();

    /**
     * return all information of xml bundled
     * @return array
     */
    public function getAllInformation();

}