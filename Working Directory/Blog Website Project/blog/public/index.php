<?php

require '../vendor/autoload.php';

//Slim configuration
require '../src/config.php';

// Some utility functions
require '../utils/functions.php';

require '../src/app.php';

// Routers
require '../src/routes/index.php';

$app->run();
