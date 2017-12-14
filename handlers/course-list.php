<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

$con = new pdo_db();

$courses = $con->getData("SELECT * FROM courses");

echo json_encode($courses);

?>