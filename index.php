<?php
require('lib/config.inc.php');

$registry = new Registry;

# Load router
$router = new Router($registry);
$registry->set('router', $router);
$registry->set('path', 'FunFamilia');

$router->setPath('app/controllers');

$router->delegate();

?>