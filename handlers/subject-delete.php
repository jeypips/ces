<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

$con = new pdo_db("subjects");

$delete = $con->deleteData(array("subject_id"=>implode(",",$_POST['subject_id'])));	

?>