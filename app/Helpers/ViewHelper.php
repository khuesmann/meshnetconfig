<?php

if (!function_exists('isActive')) {
    function isActive($route, $output = "class='active'")
    {
        if(is_array($route)) {
            foreach($route as $path)
            {
                if (Route::currentRouteName() == $path) return $output;
            }
        }
        else {
            if (Route::currentRouteName() == $route) return $output;
        }
    }
}

if (!function_exists('isSelected')) {
    function isSelected($parameter1, $parameter2)
    {
        if(is_array($parameter1)) {
            if(in_array($parameter2, $parameter1)) return "selected";
        }

        if(is_array($parameter2)) {
            if(in_array($parameter1, $parameter2)) return "selected";
        }

        if($parameter1 === "" && ($parameter2 === 0 || $parameter2 === false)) {
            return "";
        };

        if($parameter1 == $parameter2) return "selected";

        return "";
    }
}

if (!function_exists('isChecked')) {
    function isChecked($parameter1, $parameter2)
    {
        if($parameter1 == $parameter2) return "checked";
        return "";
    }
}

if (!function_exists('hasError')) {
    function hasError($name, $error) {
        if(!empty($error->first($name))) return "has-error";
        return null;
    }
}