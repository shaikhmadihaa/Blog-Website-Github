<?php

function dnd($var)
{
    echo '<pre>';
    var_dump($var);
    echo '</pre>';
    die;
}

function getMenu()
{
    return [
        'home' => ['name' => 'Home', 'path' => '/'],
        // 'category' => [
        //     'name' => 'Category', 
        //     'dropdown' => [
        //         'PHP' => '/tutorials/php',
        //         'JavaScript' => '/tutorials/javascript',
        //         'HTML' => '/tutorials/html',
        //         'CSS' => '/tutorials/css',
        //     ]
        // ],
        'Post' => ['name' => 'Post', 'path' => '/tutorials/php'],
        'Author Request' => ['name' => 'Author Request', 'path' => '/contact'],
    ];
}
