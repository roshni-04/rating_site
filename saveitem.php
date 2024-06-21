<?php
//include 'controllers/pg_connect.php';
include 'generic/upload_file_func.php';
include 'generic/validator.php';
$s=0;

$pdo = NULL;

try{

  $i_cat    = intval($_POST['ddlcategory']);
  //echo $s_name;
  $i_name     =filter_myinput($_POST['txtname']);
  /*if(!preg_match("[a-zA-Z0-9 ]+",$i_name ))
  {
    throw new Exception("");
  }*/
  $i_desc  = filter_myinput($_POST['txtdesc']);
  $i_site1   =filter_myinput($_POST['txtsite']);
  $i_rate1   = floatval($_POST['txtrate']);
  $i_price1    =floatval($_POST['txtprice']);
  $i_sales1   =intval($_POST['txtsales']);
  $i_url1   =$_POST['txturl1'];
  $i_site2   =filter_myinput($_POST['txtsite2']);
  $i_rate2   =floatval($_POST['txtrate2']);
  $i_price2    =floatval($_POST['txtprice2']);
  $i_sales2   =intval($_POST['txtsales2']);
  $i_url2   =$_POST['txturl2'];
  $img_path="";
  $errormsg="";
  if(!empty($_FILES["file-image"]["name"]))
  {
    $ret=upload_to_server($_FILES["file-image"]);
    $status=explode("~",$ret);
    if($status[0]=="1")
    {
    $img_path=$status[1];
  

    }
    else
    {
    $errormsg=$status[1];
    }
  }

/*
$avgRating = (($i_rate * $i_sales) + ($i_rate2 * $i_sales2))/($i_sales + $i_sales2);

$sql="insert into items(item_id,item_name,item_desc,item_cat, avg_rating) values((select max(item_id)+1 from items),$1, $2,$3, $4)";
$pstmt=pg_prepare($pg_conn,"prep",$sql);
$r=pg_execute($pg_conn,"prep",array($i_name,$i_desc,$i_cat, $avgRating));

$sql="insert into ratings(item_id,site_name,rating_value,price,sales,url) values((select max(item_id) from items),$1, $2,$3,$4,$5)";
$pstmt=pg_prepare($pg_conn,"prep1",$sql);
$r=pg_execute($pg_conn,"prep1",array($i_site,$i_rate,$i_price,$i_sales,$i_url));

$sql="insert into ratings(item_id,site_name,rating_value,price,sales,url) values((select max(item_id) from items),$1, $2,$3,$4,$5)";
$pstmt=pg_prepare($pg_conn,"prep2",$sql);
$r=pg_execute($pg_conn,"prep2",array($i_site2,$i_rate2,$i_price2,$i_sales2,$i_url2));
*/

//-------------- works fine but rasises exception for special symbols----------------------
// $sql = "select save_item_details('".$i_name."', '".$i_desc."', ".$i_cat.", '".$i_site1."', ".$i_rate1.", ".$i_price1.", ".$i_sales1.", '".$i_url1."', '".$i_site2."', ".$i_rate2.", ".$i_price2.", ".$i_sales2.", '".$i_url2."','".$img_path."')";
// $result = pg_query($pg_conn, $sql);


# * * * * * pg_query_params() -> safely escapes the harmful special symbols * * * * *
  // $sql = "select save_item_details($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)";
  // $result = pg_query_params($pg_conn, $sql, array($i_name, $i_desc, $i_cat, $i_site1, $i_rate1, $i_price1, $i_sales1, $i_url1,
  //    $i_site2, $i_rate2, $i_price2, $i_sales2, $i_url2, $img_path));


      $pdo = require_once 'pdo/PDOConnection.php';

      $pdo->beginTransaction();

      $sql = "CALL save_item_details(:item_name, :item_desc, :item_cat, :site_name1, :rating_value1, :price1, :sales1, :url1,
      :site_name2, :rating_value2, :price2, :sales2, :url2, :imgpath)";

        $statement = $pdo->prepare($sql);

        $statement->bindParam(':item_name', $i_name, PDO::PARAM_STR);
        $statement->bindParam(':item_desc', $i_desc, PDO::PARAM_STR);  // * * * * FOR fractional values (numeric/float) use STR
        $statement->bindParam(':item_cat', $i_cat, PDO::PARAM_INT);
        $statement->bindParam(':site_name1', $i_site1, PDO::PARAM_STR);
        $statement->bindParam(':rating_value1', $i_rate1, PDO::PARAM_STR);
        $statement->bindParam(':price1', $i_price1, PDO::PARAM_STR);
        $statement->bindParam(':sales1', $i_sales1, PDO::PARAM_INT);
        $statement->bindParam(':url1', $i_url1, PDO::PARAM_STR);
        $statement->bindParam(':site_name2', $i_site2, PDO::PARAM_STR);
        $statement->bindParam(':rating_value2', $i_rate2, PDO::PARAM_STR);
        $statement->bindParam(':price2', $i_price2, PDO::PARAM_STR);
        $statement->bindParam(':sales2', $i_sales2, PDO::PARAM_INT);
        $statement->bindParam(':url2', $i_url2, PDO::PARAM_STR);
        $statement->bindParam(':imgpath', $img_path, PDO::PARAM_STR);

        
        if($statement->execute()){
          $s = 1;

          $pdo->commit();
        }



// if($result){ //save successful;
//     $s = 1;
// }

} catch(Exception $e){
  $s=0;
  echo $e->getMessage();
  $pdo->rollback();
}
finally{
  $pdo->setAttribute(PDO::ATTR_AUTOCOMMIT,1); // setting auto-commit ON => 1
  $pdo = NULL;
}

 header("location: itementry.php?status=".$s);

?>

