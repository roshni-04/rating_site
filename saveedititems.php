<?php

$pdo = require_once 'pdo/PDOConnection.php';
include 'generic/upload_file_func.php';
include 'generic/validator.php';
$s=0;
$result=NULL;

try {

    $item_id = $_POST['hdn_item_id']; //hidden
    $i_name  =filter_myinput($_POST['txtname']);
    $i_desc  = filter_myinput($_POST['txtdesc']);
    //str_replace('\'', '\'\'', $i_desc);
    $i_cat    =$_POST['ddlcategory'];

    $i_site1   =filter_myinput($_POST['txtsite_1']);
    $i_rate1   =floatval($_POST['txtrate_1']);
    $i_price1  =floatval($_POST['txtprice_1']);
    $i_sales1  =intval($_POST['txtsales_1']);
    $i_url1    =$_POST['txturl_1'];

    $i_site2   =filter_myinput($_POST['txtsite_2']);
    $i_rate2   =floatval($_POST['txtrate_2']);
    $i_price2  =floatval($_POST['txtprice_2']);
    $i_sales2  =intval($_POST['txtsales_2']);
    $i_url2    =$_POST['txturl_2'];

    $img_path=$_POST["hdnimg"];
    $errormsg="";

    if(!empty($_FILES["file-image"]["name"])) {
      $ret=upload_to_server($_FILES["file-image"]);
      $status=explode("~",$ret);
      if($status[0]=="1") {
        $img_path=$status[1];
      } else {
        $errormsg=$status[1];
      }
    }


    //-------------- works fine ----------------------
    // $sql = "select edit_item_details(".$item_id.", '".$i_name."', '".$i_desc."', ".$i_cat.", '".$i_site1."', ".$i_rate1.", ".$i_price1.", ".$i_sales1.", '".$i_url1."', '".$i_site2."', ".$i_rate2.", ".$i_price2.", ".$i_sales2.", '".$i_url2."','".$img_path."')";
    // $result = pg_query($pg_conn, $sql);

      # * * * * * pg_query_params() -> safely escapes the harmful special symbols * * * * *
      $pdo->beginTransaction();

      $sql = "CALL edit_item_details(:item_id, :i_name, :i_desc, :i_cat, :i_site1, :i_rate1, :i_price1, :i_sales1, :i_url1, :i_site2, :i_rate2, :i_price2, :i_sales2, :i_url2, :img_path)";

      $statement = $pdo->prepare($sql);
        $statement->bindParam(':item_id', $item_id, PDO::PARAM_INT);
        $statement->bindParam(':i_name', $i_name, PDO::PARAM_STR);  // * * * * FOR fractional values (numeric/float) use STR
        $statement->bindParam(':i_desc', $i_desc, PDO::PARAM_STR);
        $statement->bindParam(':i_cat', $i_cat, PDO::PARAM_INT);
        $statement->bindParam(':i_site1', $i_site1, PDO::PARAM_STR);
        $statement->bindParam(':i_rate1', $i_rate1, PDO::PARAM_STR);
        $statement->bindParam(':i_price1', $i_price1, PDO::PARAM_STR);
        $statement->bindParam(':i_sales1', $i_sales1, PDO::PARAM_INT);
        $statement->bindParam(':i_url1', $i_url1, PDO::PARAM_STR);
        $statement->bindParam(':i_site2', $i_site2, PDO::PARAM_STR);
        $statement->bindParam(':i_rate2', $i_rate2, PDO::PARAM_STR);
        $statement->bindParam(':i_price2', $i_price2, PDO::PARAM_STR);
        $statement->bindParam(':i_sales2', $i_sales2, PDO::PARAM_INT);
        $statement->bindParam(':i_url2', $i_url2, PDO::PARAM_STR);
        $statement->bindParam(':img_path', $img_path, PDO::PARAM_STR);

      if($statement->execute()){
        $s = 1;
        $pdo->commit();
      }
  } catch(Exception $e){
    $s=0;
    echo $e->getMessage();
    $pdo->rollback();

  } finally{
    $pdo->setAttribute(PDO::ATTR_AUTOCOMMIT,1); // setting auto-commit ON => 1
    $pdo = NULL;
  }

// Redirect back to item_list.php with status
 header("location: item_list.php?catid=".$i_cat."&status=" . $s);

?>
