<?php
namespace App\Helper;
class Formater
{

    /**
     * Formats timestamp string 
     *
     * @param string $timeStamp
     * @param string $format
     * @return string
     */
    public static function dateFormat(string $timeStamp, string $format): string
    {
        $date = new \DateTime($timeStamp);
        return $date->format($format);
    }

    /**
     * Converts space sepated words to dash separated,
     * this method also converts the string to lowercase
     *
     * @param string $str
     * @return string
     */
    public static function space2dash(string $str): string
    {
        $str = strtolower($str);
        $result = str_replace(' ', '-', $str);
        return $result;
    }

    /**
     * Truncate string to specific length
     *
     * @param string $string
     * @param integer $maxlength
     * @param string $extension
     * @return string
     */
    public static function truncateString(string $string, int $maxlength, string $extension): string
    {
        // Set the replacement for the "string break" in the wordwrap function
        $cutmarker = "**cut_here**";
    
        // Checking if the given string is longer than $maxlength
        if (strlen($string) > $maxlength) {
    
            // Using wordwrap() to set the cutmarker
            // NOTE: wordwrap (PHP 4 >= 4.0.2, PHP 5)
            $string = wordwrap($string, $maxlength, $cutmarker);
    
            // Exploding the string at the cutmarker, set by wordwrap()
            $string = explode($cutmarker, $string);
    
            // Adding $extension to the first value of the array $string, returned by explode()
            $string = $string[0] . $extension;
        }
    
        // returning $string
        return $string;
    
    }
}
