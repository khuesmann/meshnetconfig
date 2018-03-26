<?php
/**
 * Created by PhpStorm.
 * User: karim
 * Date: 10/26/16
 * Time: 3:06 PM
 */

namespace App\Traits;


trait EmptyStringToNullTrait
{
    private $emptyStringVariables = [];

    public function setAttribute($key, $value)
    {
        if (is_scalar($value) && in_array($key, $this->emptyStringVariables)) {
            $value = $this->emptyStringToNull(trim($value));
        }

        return $this->setAttribute($key, $value);
    }


    /**
     * return null value if the string is empty otherwise it returns what every the value is
     *
     */
    private function emptyStringToNull($string)
    {
        //trim every value
        $string = trim($string);

        if ($string === ''){
            return null;
        }

        return $string;
    }
}