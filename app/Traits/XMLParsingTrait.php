<?php
/**
 * Created by PhpStorm.
 * User: karim
 * Date: 6/11/16
 * Time: 3:03 PM
 */

namespace App\Traits;


use App\Models\Mapping;
use App\Models\XMLParser;

trait XMLParsingTrait
{
    protected $previousXmlPath = "";
    protected $xmlObject;

    public function getPath($varible)
    {
        return $this->getClassName() . "_" . $varible;
    }

    public function getXmlPath($variable)
    {
        $xmlPath = Mapping::getXmlPath($this->getPath($variable));
        if(!empty($this->previousXmlPath)) $xmlPath = trim(str_replace($this->previousXmlPath, "", $xmlPath), ".");
        return $xmlPath;
    }

    public static function createByXmlObject($xmlObject, $previousPath)
    {
        $className = get_called_class();
        $object = new $className;
        $object->setXmlObject($xmlObject);
        $object->setPreviousXmlPath($previousPath);
        return $object;
    }

    public function getClassName() {
        $path = explode('\\', get_class($this));
        return array_pop($path);
    }

    /**
     * @return string
     */
    public function getPreviousXmlPath()
    {
        return $this->previousXmlPath;
    }

    /**
     * @param string $previousXmlPath
     */
    public function setPreviousXmlPath($previousXmlPath)
    {
        $this->previousXmlPath .= "." . $previousXmlPath;
        $this->previousXmlPath = trim($this->previousXmlPath, ".");
    }

    /**
     * @return mixed
     */
    public function getXmlObject()
    {
        return $this->xmlObject;
    }

    /**
     * @param mixed $xmlObject
     */
    public function setXmlObject($xmlObject)
    {
        $this->xmlObject = $xmlObject;
    }

    public function getFullPreviousPath($variable)
    {
        if(empty($this->getPreviousXmlPath())) {
            return $this->getXmlPath($variable);
        }

        return $this->getPreviousXmlPath() . "." . $this->getXmlPath($variable);
    }

    public function getParameter($name)
    {
        $this->$name = XMLParser::parse($this->xmlObject, $this->getXmlPath($name));
        if(empty($this->$name)) return null;
        return $this->$name;
    }

    public function getChildren($parameter, $className)
    {
        if(! $this->$parameter)
        {
            $results = XMLParser::parse($this->xmlObject, $this->getXmlPath($parameter));

            if(count($results) > 0)
            {
                foreach($results as $result)
                {
                    $this->$parameter[] = $className::createByXmlObject($result, $this->getFullPreviousPath($parameter));
                }
            }
        }
        return $this->$parameter;
    }
}