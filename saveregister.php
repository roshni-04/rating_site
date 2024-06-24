<?php
    $status1=$status2=0;
    try{


    $pdo = require_once 'pdo/PDOConnection.php';


    $s_name     =$_POST['txtName'];
    //echo $s_name;
    $s_email=$_POST['txtEmail'];
    $s_phno=$_POST['phno'];
    $s_gender   =$_POST['ddlgender'];
    $s_dob=$_POST['txtDob'];
    $s_addr=$_POST['txtaddr'];
    $s_uname = $_POST['txtUName'];
    $s_pass= $_POST['upass'];
    $s=str_replace('/','-',$s_dob);
    $dob=date('Y-m-d',strtotime($s));

    $access_lvl = 3; // Assuming access level for customer

    $pdo->beginTransaction();


            $sql_mas_user = "INSERT INTO mas_user(uname, upass, access_lvl) VALUES (:uname, :upass, :access_lvl)";
            $statement1 = $pdo->prepare($sql_mas_user);

            $statement1->bindParam(':uname', $s_uname, PDO::PARAM_STR);
            $statement1->bindParam(':upass', $s_pass, PDO::PARAM_STR);  // * * * * FOR fractional values (numeric/float) use STR
            $statement1->bindParam(':access_lvl', $access_lvl, PDO::PARAM_INT);
            

            if( $statement1->execute()){//if query executed successfully then returns true
                $status1=1;
            }

            $sql_uid = "SELECT max(uid) as max_uid from mas_user";
            $stmnt = $pdo->prepare($sql_uid);
            $stmnt -> execute(); 
            $result = $stmnt->fetch(PDO::FETCH_ASSOC);
            $maxuid = 0;
            //$row = $result;
            $maxuid = $result['max_uid'];


            $sql="insert into customers(cus_name,email,ph_no, gender,bdate,address,uid) values(:cus_name,:email,:ph_no, :gender,:bdate,:address,:uid)";
    //$sql="insert into customers(cus_name,email,ph_no, gender,bdate,address) values($1, $2,$3, $4, $5,$6)";
    // $pstmt=pg_prepare($pg_conn,"prep",$sql);
    // $r=pg_execute($pg_conn,"prep",array($s_name,$s_email,$s_phno,$s_gender,$s_dob,$s_addr));
            $statement2 = $pdo->prepare($sql);
            $statement2->bindParam(':cus_name', $s_name, PDO::PARAM_STR);
            $statement2->bindParam(':email', $s_email, PDO::PARAM_STR);  // * * * * FOR fractional values (numeric/float) use STR
            $statement2->bindParam(':ph_no', $s_phno, PDO::PARAM_STR);
            $statement2->bindParam(':gender', $s_gender, PDO::PARAM_STR);
            $statement2->bindParam(':bdate', $dob, PDO::PARAM_STR);
            $statement2->bindParam(':address', $s_addr, PDO::PARAM_STR);
            $statement2->bindParam(':uid', $maxuid, PDO::PARAM_INT);

            if( $statement2->execute()){//if query executed successfully then returns true
                $status2=1;
            }


        

        $pdo->commit();
    }
    catch(Exception $e)
    {
        //echo($e->getMessage());
        $pdo->rollback();
        $status1=$status2=0;
    }
    finally
    {
        $pdo->setAttribute(PDO::ATTR_AUTOCOMMIT,1); // setting auto-commit ON => 1

        // Close the connection
        $pdo=NULL;
    }

    $s = 0;
   if($status1==1 && $status2==1){
        $s=1;
        header("location: login.php?status=".$s);
   } else {
        header("location: register.php?status=".$s);
   }
        
    ?>


