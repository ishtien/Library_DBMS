<?php
$servername = "127.0.0.1";
$username = "root";
$password = "ish850312";
$database = "csie_library";

// connection
$conn = new mysqli($servername, $username, $password, $database);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$conn->query("SET NAMES UTF8");

switch ($_REQUEST["request"]) {
    case "search":
        $searchType = $_POST["searchType"];
        $searchText = $_POST["searchText"];
        $query = "SELECT * FROM `reader` WHERE `".$searchType."` = '" .$searchText."';";
        $result = $conn->query($query);
        if ($result->num_rows > 0) {
            // output data of each row
            while($row = $result->fetch_assoc()) {
                echo "id: " . $row["reader_id"]. " - Name: " . $row["reader_name"]. " - Status: " . $row["reader_status"]. "<br>";
            }
        } else {
            echo "0 results";
        }
        break;

    case "insert":
        // insert
        $id = (int)$_POST["insertId"];
        $name = $_POST["insertName"];
        $author = $_POST["insertAuthor"];
        $importDate = $_POST["insertImportdate"];
        $position = $_POST["insertPosition"];
        $insert = "INSERT INTO reader (reader_id, reader_name, register_date, reader_sex, reader_status) VALUES ($id, '".$name."','". $author."', '".$importDate."', '".$position."');";
        if ($conn->query($insert) === TRUE) {
            echo "New record created successfully";
        } else {
            echo "Error: " . $insert . "<br>" . $conn->error;
        }
        break;
    
    case "delete":
        $id = (int)$_POST["deleteId"];
        $delete = "DELETE FROM reader WHERE reader_id=".$id.";";
        echo $delete;
        if ($conn->query($delete) === TRUE) {
            echo "Record deleted successfully";
        } else {
            echo "Error deleting record: " . $conn->error;
        }
        break;
    
    case "update":
        $id = (int)$_POST["updateId"];
        $type = $_POST["updateType"];
        $content = $_POST["updateContent"];
        switch ($type){
            case "name":
                $update = "UPDATE reader SET reader_id='".$content."' WHERE reader_id = $id;";
                break;
            case "author":
                $update = "UPDATE reader SET reader_name='".$content."' WHERE reader_id = $id;";
                break;
            case "import-date":
                $update = "UPDATE reader SET register_date='".$content."' WHERE reader_id = $id;";
                break;
            case "position":
                $update = "UPDATE reader SET reader_sex='".$content."' WHERE reader_id = $id;";
                break;
            case "category":
                $update = "UPDATE reader SET reader_status='".$content."' WHERE reader_id = $id;";
                break;
            
        }
        if ($conn->query($update) === TRUE) {
            echo "Record Update successfully";
        } else {
            echo "Error updating record: " . $conn->error;
        }                
                        
        break;
    case "updateTable": 
        $query = "SELECT * FROM `reader`;";
        $result = $conn->query($query);
        if ($result->num_rows > 0) {
            // output data of each row
            while($row = $result->fetch_assoc()) {
              echo "id: " . $row["reader_id"]. " - Name: " . $row["reader_name"]. " - Status: " . $row["reader_status"]. "<br>";
            }
        } else {
            echo "0 results";
        }
        break;
    case "countReader":
        $query = "SELECT COUNT(*) as total FROM reader ;";
        $result = $conn->query($query);
        $data = mysqli_fetch_assoc($result);
        echo $data['total'];
        break;
}



$conn->close();
?>