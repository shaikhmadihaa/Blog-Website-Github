<?php

use Illuminate\Database\Capsule\Manager as Capsule;

$dotenv = Dotenv\Dotenv::create('../');
$dotenv->load();

$capsule = new Capsule();

$capsule->addConnection(
    [
        'driver' => getenv('DATABASE_DRIVER'),
        'host' => getenv('DATABASE_HOST'),
        'database' => getenv('DATABASE'),
        'username' => getenv('DATABASE_USER'),
        'password' => getenv('DATABASE_PWD'),
        'charset' => 'utf8',
        'collation' => 'utf8_unicode_ci',
        'prefix' => '',
    ]
);

$capsule->setAsGlobal();
$capsule->bootEloquent();

$app = new Slim\App($container);

$app->add(new \App\Middleware\TrailSlashRoute());
