<?php

$container['settings'] = [
    'displayErrorDetails' => true,

    'logger' => [
        'name' => 'slim-app',
        'level' => Monolog\Logger::DEBUG,
        'path' => __DIR__.'/../logs/app.log',
    ],
];

$container['renderer'] = function () {
    $view = new Slim\Views\PhpRenderer('./templates');
    $view->setLayout('layout.php');

    return $view;
};
