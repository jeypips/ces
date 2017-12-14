<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

$con = new pdo_db("sections");

if ($_POST['sections']['section_id']) { // > 0 - update
	$section = $con->updateData($_POST['sections'],'section_id');
} else { // 0 - insert
	unset($_POST['sections']['section_id']);
	$section = $con->insertData($_POST['sections']);
	$section_id = $con->insertId;
}

?>