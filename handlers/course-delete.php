<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

$con = new pdo_db("courses");

$delete = $con->deleteData(array("course_id"=>implode(",",$_POST['course_id'])));	

?>