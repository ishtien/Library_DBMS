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
    case "in":   
        $capacity1 = (int)$_POST["inCapacity1"];
        $capacity2 = (int)$_POST["inCapacity2"];
        $query = "SELECT * FROM meeting_room WHERE capacity IN ( {$capacity1}, {$capacity2}) ;";
        $result = $conn->query($query);
        if ($result->num_rows > 0) {
          // output data of each row
          while($row = $result->fetch_assoc()) {
              echo "id: " . $row["meeting_room_id"]. " - capacity: " . $row["capacity"]. " - hasProjector: " . $row["projector"]. "<br>";
          }
        } else {
            echo "0 results";
        }
        break;

    case "notin":   
        $capacity1 = (int)$_POST["notinCapacity1"];
        $capacity2 = (int)$_POST["notinCapacity2"];
        $query = "SELECT * FROM meeting_room WHERE capacity NOT IN ( {$capacity1}, {$capacity2}) ;";
        $result = $conn->query($query);
        if ($result->num_rows > 0) {
          // output data of each row
          while($row = $result->fetch_assoc()) {
              echo "id: " . $row["meeting_room_id"]. " - capacity: " . $row["capacity"]. " - hasProjector: " . $row["projector"]. "<br>";
          }
        } else {
            echo "0 results";
        }
        break;

    case "having":
        $query = "SELECT employee.employee_id, employee.employee_name, borrow_venue.meeting_room_id, borrow_venue.borrow_date, borrow_venue.is_returned FROM `borrow_venue` LEFT JOIN `employee` ON borrow_venue.employee_id = employee.employee_id WHERE borrow_venue.borrow_date BETWEEN '2020-01-01' AND '2020-12-31' GROUP BY employee.employee_id HAVING SUM(borrow_venuE.meeting_room_id);";
        $result = $conn->query($query);
        if ($result->num_rows > 0) {
          // output data of each row
          while($row = $result->fetch_assoc()) {
              echo "name: " . $row["employee_name"]. " - meeting room id: " . $row["meeting_room_id"]." - book date: " . $row["borrow_date"]." - isreturned: " . $row["is_returned"]. "<br>";
          }
        } else {
            echo "0 results";
        }
        break;
    
}



$conn->close();
?>