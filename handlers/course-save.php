<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

$con = new pdo_db("courses");

if ($_POST['courses']['course_id']) { // > 0 - update
	$course = $con->updateData($_POST['courses'],'course_id');
} else { // 0 - insert
	unset($_POST['courses']['course_id']);
	$course = $con->insertData($_POST['courses']);
	$course_id = $con->insertId;
}

?>