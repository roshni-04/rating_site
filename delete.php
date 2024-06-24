<?php
// include 'controllers/pg_connect.php';
$pdo = require_once 'pdo/PDOConnection.php';

//try {
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Assuming you're receiving the item_id via POST
    $item_id = isset($_POST['item_id']) ? $_POST['item_id'] : 0;

    if ($item_id > 0) {
        // Delete from ratings table
        $deleteRatingsQuery = "DELETE FROM ratings WHERE item_id = :item_id";
        //$resultRatings = pg_query($pg_conn, $deleteRatingsQuery);

        $stmnt = $pdo->prepare($deleteRatingsQuery);
        $stmnt->bindParam(':item_id', $item_id, PDO::PARAM_INT);
        $stmnt->execute();

        $rstatus = 0;
            if($stmnt->execute()){
                $rstatus = 1;
            } 

        // Delete from items table
        $deleteItemsQuery = "DELETE FROM items WHERE item_id = :item_id";
        //$resultItems = pg_query($pg_conn, $deleteItemsQuery);

        $st = $pdo->prepare($deleteItemsQuery);
        $st->bindParam(':item_id', $item_id, PDO::PARAM_INT);

        $istatus = 0;
            if($st->execute()){
                $istatus = 1;
            } 
        

        if ($rstatus && $istatus) {
            $response = array('status' => 'success', 'message' => 'Item deleted successfully');
        } else {
            $response = array('status' => 'error', 'message' => 'Failed to delete item.');
        }

        echo json_encode($response);
    } else {
        $response = array('status' => 'error', 'message' => 'Invalid item ID');
        echo json_encode($response);
    }
} else {
    $response = array('status' => 'error', 'message' => 'Invalid request method');
    echo json_encode($response);
}

//$pdo = NULL;

?>
