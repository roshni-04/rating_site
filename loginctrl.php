<?php

$pdo=require_once 'pdo/PDOConnection.php';

$uname     =$_POST['usrname'];
//echo $s_name;
$upass      =$_POST['usrpass'];
$urole     =$_POST['role'];

if($urole==2)//employee login
{
$sql="select uname, upass, mu.uid, emp_name,access_lvl from mas_user mu inner join employee emp ON mu.uid=emp.uid where uname = :uname and upass= :upass";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':uname', $uname, PDO::PARAM_STR);
$stmt->bindParam(':upass', $upass, PDO::PARAM_STR);
$stmt->execute();
$row_cnt = $stmt->rowCount();

$status = 0; //failed
if($row_cnt == 1){ //succes
   $status = 1;

   $row = $stmt->fetch(PDO::FETCH_OBJ);  // reads the record pointer by the data pointer

   // set session data
   session_start(); // create a new session if there is no existing session
   $_SESSION["user_name"] = $uname;
   $_SESSION['user_id'] = $row->uid;
   $_SESSION["acc_lvl"] = $row->access_lvl;

} else { //fail
   //echo "fail";
}


$stmt = null;

if ($status == 0) {
    // User not found, display an alert
    echo '<script>alert("User not found. Please sign up"); window.location.href = "emp_register.php";</script>';
} else {
    // Successful login
    header("location: index.php");
}
}
else if($urole==3)//customer login
{
$sql="select uname, upass, mu.uid, cus_name,access_lvl from mas_user mu inner join customers cus ON mu.uid=cus.uid where uname = :uname and upass= :upass";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':uname', $uname, PDO::PARAM_STR);
$stmt->bindParam(':upass', $upass, PDO::PARAM_STR);
$stmt->execute();

$row_cnt = $stmt->rowCount();

$status = 0; //failed
if($row_cnt == 1){ //succes
   $status = 1;

   $row = $stmt->fetch(PDO::FETCH_OBJ); // reads the record pointer by the data pointer

   // set session data
   session_start(); // create a new session if there is no existing session
   $_SESSION["user_name"] = $uname;
   $_SESSION['user_id'] = $row->uid;
   $_SESSION["acc_lvl"] = $row->access_lvl;

} else { //fail
   //echo "fail";
}


$stmt = null;

if ($status == 0) {
    // User not found, display an alert
    echo '<script>alert("User not found. Please sign up"); window.location.href = "register.php";</script>';
} else {
    // Successful login
    header("location: index.php");
}
}


?>