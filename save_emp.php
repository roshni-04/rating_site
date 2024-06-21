<?php

$status1=$status2=0;
try{

        $pdo = require_once 'pdo/PDOConnection.php';

    $s_name     =$_POST['txtName'];
    //echo $s_name;
    $s_email=$_POST['txtEmail'];
    $s_uname = $_POST['txtUName'];
    $s_pass=$_POST['upass'];

    $pdo->beginTransaction();

    $sql="insert into employee(emp_name,email) values(:emp_name,:email)";
    $statement1 = $pdo->prepare($sql);
    $statement1->bindParam(':emp_name', $s_name, PDO::PARAM_STR);
    $statement1->bindParam(':email', $s_email, PDO::PARAM_STR);  // * * * * FOR fractional values (numeric/float) use STR
    $status1 = $statement1->execute();    

    $access_lvl = 2; // Assuming access level for employees
    $sql_mas_user = "INSERT INTO mas_user(uname, upass, access_lvl) VALUES (:uname, :upass, :access_lvl)";
    $statement2 = $pdo->prepare($sql_mas_user);
    $statement2->bindParam(':uname', $s_uname, PDO::PARAM_STR);
    $statement2->bindParam(':upass', $s_pass, PDO::PARAM_STR);
    $statement2->bindParam(':access_lvl', $access_lvl, PDO::PARAM_INT);
    $status2 = $statement2->execute();
            

    // if($r == NULL || $r_mas_user == NULL){
    //     echo "data saving failed";
    // } else{
    //     echo "data saved successfully";
    // }

    $pdo->commit();


} catch(Exception $e) {
    //echo($e->getMessage());
    $pdo->rollback();
    $status1=$status2=0;
} finally {
    
    $pdo->setAttribute(PDO::ATTR_AUTOCOMMIT,1); // setting auto-commit ON => 1
    // Close the connection
    $pdo=NULL;
}

    $s = 0;
   if($status1==1 && $status2==1){
        $s=1;
        header("location: login.php?status=".$s);
   } else {
        header("location: emp_register.php?status=".$s);
   }
   
   
    

// if ($r != NULL) {
//     pg_free_result($r);
// }

// if ($r_mas_user != NULL) {
//     pg_free_result($r_mas_user);
// }

// // Close the connection
// if ($pg_conn != NULL) {
//     pg_close($pg_conn);
// }

// $s = 0;

// if ($r && $r_mas_user) {
//     $s = 1;
//     // echo('Saved Successfully! Redirecting to Login page.');
//     header("location: login.php?status=".$s);
// } else {
//     header("location: emp_register.php?status=".$s);
// }
    // header("location: login.php?status=".$s);
    
?>