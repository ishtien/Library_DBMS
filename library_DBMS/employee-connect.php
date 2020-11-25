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
    case "sum":
        $query = "SELECT SUM(employee_salary) as total FROM employee ;";
        $result = $conn->query($query);
        $data = mysqli_fetch_assoc($result);
        echo $data['total'];
        break;

    case "avg":
        $query = "SELECT AVG(employee_salary) as total FROM employee ;";
        $result = $conn->query($query);
        $data = mysqli_fetch_assoc($result);
        echo $data['total'];
        break;

    case "min":
        $query = "SELECT MIN(employee_salary) as total FROM employee ;";
        $result = $conn->query($query);
        $data = mysqli_fetch_assoc($result);
        echo $data['total'];
        break;

    case "max":
        $query = "SELECT MAX(employee_salary) as total FROM employee ;";
        $result = $conn->query($query);
        $data = mysqli_fetch_assoc($result);
        echo $data['total'];
        break;
    
}



$conn->close();
?>