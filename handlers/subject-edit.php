<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

$con = new pdo_db();

$subject = $con->getData("SELECT * FROM subjects WHERE subject_id = $_POST[subject_id]");

echo json_encode($subject[0]);

?>