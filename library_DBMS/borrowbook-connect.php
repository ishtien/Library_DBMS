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
    case "exist":
        $query = "SELECT * FROM reader WHERE EXISTS (SELECT * FROM borrow_book WHERE reader.reader_id=borrow_book.reader_id and borrow_book.is_returned = false);";
        $result = $conn->query($query);
        if ($result->num_rows > 0) {
          // output data of each row
          while($row = $result->fetch_assoc()) {
              echo "id: " . $row["reader_id"]. " - Name: " . $row["reader_name"]. "<br>";
          }
        } else {
          echo "0 results";
        }
        break;

    case "not-exist":
        $query = "SELECT * FROM reader WHERE NOT EXISTS (SELECT * FROM borrow_book WHERE reader.reader_id = borrow_book.reader_id);";
        $result = $conn->query($query);
        if ($result->num_rows > 0) {
          // output data of each row
          while($row = $result->fetch_assoc()) {
              echo "id: " . $row["reader_id"]. " - Name: " . $row["reader_name"]. "<br>";
          }
        } else {
          echo "0 results";
        }
        break;
    
}



$conn->close();
?>