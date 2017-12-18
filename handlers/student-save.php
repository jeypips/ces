<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

/*
** filters: date
*/

if (isset($_POST['student_info']['student_birthday'])) $_POST['student_info']['student_birthday'] = date("Y-m-d",strtotime($_POST['student_info']['student_birthday']));
	
/*
**
*/

$con = new pdo_db("student_infos");
if ($_POST['student_info']['student_id']) { // > 0 - update
	$student_info = $con->updateData($_POST['student_info'],'student_id');
} else { // 0 - insert
	unset($_POST['student_info']['student_id']);
	$student_info = $con->insertData($_POST['student_info']);
	$student_id = $con->insertId;
}

/* $con->table = "academic_info";
if ($_POST['academic_info']['id_number']) { // update
	$academic_info = $con->updateData($_POST['academic_info'],'id_number');
} else { // save
	unset($_POST['academic_info']['id_number']);
	$_POST['academic_info']['students'] = $id_number;
	$academic_info = $con->insertData($_POST['academic_info']);		
}

$con->table = "parental_info";
if ($_POST['parental_info']['id_number']) { // update
	$parental_info = $con->updateData($_POST['parental_info'],'id_number');
} else { // save
	unset($_POST['parental_info']['id_number']);
	$_POST['parental_info']['students'] = $id_number;
	$parental_info = $con->insertData($_POST['parental_info']);		
} */

?>