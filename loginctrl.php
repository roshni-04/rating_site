<?php
$pdo = require_once 'pdo/PDOConnection.php';

$uname     =$_POST['usrname'];
//echo $s_name;
$upass      =$_POST['usrpass'];
$urole     =$_POST['role'];

if($urole==2)//employee login
{
   try{
      $sql="select uname, upass, mu.uid, emp_name,access_lvl from mas_user mu inner join employee emp  ON mu.uid=emp.uid where uname= :username and upass=:password";
      $statement = $pdo->prepare($sql);

      $statement->bindParam(':username', $uname, PDO::PARAM_STR);
      $statement->bindParam(':password', $upass, PDO::PARAM_STR); 

      $statement->execute();

      $result = $statement->fetch(PDO::FETCH_ASSOC); // returns an array of rows


      $status = 0; //failed

      if($result){
         //succes
         $status = 1;

         //$row = pg_fetch_object($result); // reads the record pointer by the data pointer
         $row = $result;

         // set session data
         session_start(); // create a new session if there is no existing session
         $_SESSION["user_name"] = $uname;
         $_SESSION['user_id'] = $row['uid'];
         $_SESSION["acc_lvl"] = $row['access_lvl'];

      } else { //fail
         echo "fail";
      }

   } catch(Exception $e){
      //echo($e->getMessage());
   } finally {

      $pdo = NULL;
   }

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
   try {
      $sql="select uname, upass, mu.uid, cus_name,access_lvl from mas_user mu inner join customers cus ON 
      mu.uid=cus.uid where uname= :username and upass=:password";
      $statement = $pdo->prepare($sql);

      $statement->bindParam(':username', $uname, PDO::PARAM_STR);
      $statement->bindParam(':password', $upass, PDO::PARAM_STR); 

      $statement->execute();

      $result = $statement->fetch(PDO::FETCH_ASSOC); // returns an array of rows


      $status = 0; //failed
      if($result){
         //succes
         $status = 1;

         //$row = pg_fetch_object($result); // reads the record pointer by the data pointer
         $row = $result;

         // set session data
         session_start(); // create a new session if there is no existing session
         $_SESSION["user_name"] = $uname;
         $_SESSION['user_id'] = $row['uid'];
         $_SESSION["acc_lvl"] = $row['access_lvl'];

      } else { //fail
         //echo "fail";
      }

   } catch(Exception $e){
      //echo($e->getMessage());
   } finally {

      $pdo = NULL;
   }

      if ($status == 0) {
         // User not found, display an alert
         echo '<script>alert("User not found. Please sign up"); window.location.href = "register.php";</script>';
      } else {
         // Successful login
         header("location: index.php");
      }
}



?>