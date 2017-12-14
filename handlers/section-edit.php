<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

$con = new pdo_db();

$section = $con->getData("SELECT * FROM sections WHERE section_id = $_POST[section_id]");

echo json_encode($section[0]);

?>