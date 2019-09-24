<?php

require_once __DIR__ . '/vendor/autoload.php';

$a = 1;
$c = 2;
for ($i = 0; $i < 1000000; $i++) {
    $a += $i;
}
echo "new\n";
echo $a;