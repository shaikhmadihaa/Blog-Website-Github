<?php

namespace App\Helper;

class URI
{
    public static function canonicalUri()
    {
        $host = $_SERVER['HTTP_HOST'];
        $requestUri = $_SERVER['REQUEST_URI'];

        return 'https://'.$host.$requestUri;
    }

    public static function reqUri(): string
    {
        return $_SERVER['REQUEST_URI'];
    }
}
