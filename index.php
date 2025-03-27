#!/usr/bin/env php
<?php

use MyExample\Commands\HelloWorldCommand;
use Symfony\Component\Console\Application;

if (file_exists(__DIR__ . '/../../autoload.php')) {
    require __DIR__ . '/../../autoload.php';
} else {
    require __DIR__ . '/vendor/autoload.php';
}

/**
 * Start the console application.
 */
$app = new Application('Hello World', '1.0.0');
//$app->setDefaultCommand("hello");

$app->add(new HelloWorldCommand());
// $app->add(new AnotherCommand());

$app->run();