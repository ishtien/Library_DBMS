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
        $query = "SELECT * FROM `book` WHERE `".$searchType."` = '" .$searchText."';";
        $result = $conn->query($query);
        if ($result->num_rows > 0) {
            // output data of each row
            while($row = $result->fetch_assoc()) {
                echo "id: " . $row["book_id"]. " - Name: " . $row["book_name"]. " - Author: " . $row["author"]. "<br>";
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
        $category = $_POST["insertCategory"];
        $insert = "INSERT INTO book (book_id, book_name, author, import_date, position, book_category) VALUES ($id, '".$name."','". $author."', '".$importDate."', '".$position."', '".$category."');";
        if ($conn->query($insert) === TRUE) {
            echo "New record created successfully";
        } else {
            echo "Error: " . $insert . "<br>" . $conn->error;
        }
        break;
    
    case "delete":
        $id = (int)$_POST["deleteId"];
        $delete = "DELETE FROM book WHERE book_id=".$id.";";
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
                $update = "UPDATE book SET book_name='".$content."' WHERE book_id = $id;";
                break;
            case "author":
                $update = "UPDATE book SET author='".$content."' WHERE book_id = $id;";
                break;
            case "import-date":
                $update = "UPDATE book SET import_date='".$content."' WHERE book_id = $id;";
                break;
            case "position":
                $update = "UPDATE book SET position='".$content."' WHERE book_id = $id;";
                break;
            case "category":
                $update = "UPDATE book SET book_category='".$content."' WHERE book_id = $id;";
                break;
            
        }
        if ($conn->query($update) === TRUE) {
            echo "Record Update successfully";
        } else {
            echo "Error updating record: " . $conn->error;
        }                
                        
        break;
    case "updateTable": 
        $query = "SELECT * FROM `book`;";
        $result = $conn->query($query);
        if ($result->num_rows > 0) {
            // output data of each row
            while($row = $result->fetch_assoc()) {
                echo "id: " . $row["book_id"]. " - Name: " . $row["book_name"]. " - Author: " . $row["author"]. "<br>";
            }
        } else {
            echo "0 results";
        }
        break;
    case "countBook":
        $query = "SELECT COUNT(*) as total FROM book ;";
        $result = $conn->query($query);
        $data = mysqli_fetch_assoc($result);
        echo $data['total'];
        break;
    
    case "sqlCommand":
        $query = $_POST["text"];
        $result = $conn->query($query);
        while($a = mysqli_fetch_field($result)) {
            echo $a->name ." ";
        }
        if ($result->num_rows > 0) {
            // output data of each row
            while($row = $result->fetch_row()) {
                foreach ($row as $item)
                {
                    echo "" . $item . " ";
                }
                echo "<br />";
            }
        } else {
            echo "0 results";
        }
        

}



$conn->close();
?>