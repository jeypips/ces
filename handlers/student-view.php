<?php

$_POST = json_decode(file_get_contents('php://input'), true);

require_once '../db.php';

session_start();

$con = new pdo_db();

$student_infos = $con->getData("SELECT * FROM student_infos WHERE student_id = $_POST[student_id]");
/* $academic_info = $con->getData("SELECT * FROM academic_info WHERE students = $_POST[account_id]");
$parental_info = $con->getData("SELECT * FROM parental_info WHERE students = $_POST[account_id]"); */

// if ($students[0]['student_birthday'] != null) $students[0]['student_birthday'] = date("m/d/Y",strtotime($student_info[0]['student_birthday']));

// $student = array("students"=>$students[0],"academic_info"=>$academic_info[0],"parental_info"=>$parental_info[0]);

header("Content-Type: application/json");
echo json_encode($student_infos[0]);

?>