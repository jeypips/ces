<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

$con = new pdo_db("subjects");

if ($_POST['subject']['subject_id']) { // > 0 - update
	$subject = $con->updateData($_POST['subject'],'subject_id');
} else { // 0 - insert
	unset($_POST['subject']['subject_id']);
	$subject = $con->insertData($_POST['subject']);
	$subject_id = $con->insertId;
}

?>