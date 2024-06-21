<?php 

    $bname = $_POST['txtName'];
    $bprice = floatval($_POST['txtPrice']);
    $bqnty = (int)$_POST['txtQnty'];
    
    // OPTION 1: -------- usual execution ------
    $sql = "INSERT INTO books (book_name, price, quantity)  VALUES ('$bname', '$bprice', '$bqnty')";
    $pdo->exec($sql);  // use exec() because no results are returned


    $sql = "INSERT INTO books (book_name, price, quantity)  VALUES ('$bname', '$bprice', '$bqnty')";
    $pdo->exec($sql);  // use exec() because no results are returned
    $sql = "INSERT INTO books (book_name, price, quantity)  VALUES ('$bname', '$bprice', '$bqnty')";
    $pdo->exec($sql);  // use exec() because no results are returned
    $sql = "INSERT INTO books (book_name, price, quantity)  VALUES ('$bname', '$bprice', '$bqnty')";
    $pdo->exec($sql);  // use exec() because no results are returned
    $sql = "INSERT INTO books (book_name, price, quantity)  VALUES ('$bname', '$bprice', '$bqnty')";
    $pdo->exec($sql);  // use exec() because no results are returned


?>



<?php 

    $bname = $_POST['txtName'];
    $bprice = floatval($_POST['txtPrice']);
    $bqnty = (int)$_POST['txtQnty'];
    
    $sql="INSERT INTO books(book_name, price, quantity) VALUES(:book_name, :price, :quantity)";

    $statement = $pdo->prepare($sql);

    
    $statement->bindParam(':book_name', $bname, PDO::PARAM_STR);
    $statement->bindParam(':price', $bprice, PDO::PARAM_STR);  // * * * * FOR fractional values (numeric/float) use STR
    $statement->bindParam(':quantity', $bqnty, PDO::PARAM_INT);
    $statement->execute();


    $statement->bindParam(':book_name', $bname2, PDO::PARAM_STR);
    $statement->bindParam(':price', $bprice2, PDO::PARAM_STR);  // * * * * FOR fractional values (numeric/float) use STR
    $statement->bindParam(':quantity', $bqnty2, PDO::PARAM_INT);
    $statement->execute();
    
    $statement->bindParam(':book_name', $bname3, PDO::PARAM_STR);
    $statement->bindParam(':price', $bprice3, PDO::PARAM_STR);  // * * * * FOR fractional values (numeric/float) use STR
    $statement->bindParam(':quantity', $bqnty3, PDO::PARAM_INT);
    $statement->execute();

    $statement->bindParam(':book_name', $bname4, PDO::PARAM_STR);
    $statement->bindParam(':price', $bprice4, PDO::PARAM_STR);  // * * * * FOR fractional values (numeric/float) use STR
    $statement->bindParam(':quantity', $bqnty4, PDO::PARAM_INT);
    $statement->execute();

?>


<?php 

    $bname = $_POST['txtName'];
    $bprice = floatval($_POST['txtPrice']);
    $bqnty = (int)$_POST['txtQnty'];
    
    $sql="INSERT INTO books(book_name, price, quantity) VALUES(:book_name, :price, :quantity)";

    $statement = $pdo->prepare($sql);
    $statement->execute([ ':book_name' => $bname, ':price' => $bprice, ':quantity' => $bqnty]);  // list of parameters



?>