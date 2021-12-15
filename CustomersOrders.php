<?php
$servername = "localhost";
$username = "root";
$password = "??kqchl733pHp";
$dbname = "pizzarestaurantdb";

session_start();
$_SESSION['counter'] = (!$_SESSION['counter']) ? 0 : $_SESSION['counter'];
if($_POST['submit']) 
{
$_SESSION['counter']++;
}
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO 'customers' (CustomerID, CustomerFirstName, CustomerLastName, CustomerEmail, CustomerPhoneNumber, CustomerAddress)
VALUES ('$_SESSION['counter']'$_POST['fname'], '$_POST['lname']', '$_POST['emailadd']', '$_POST['Pnum']', '$_POST['Streetadd']', )";
$sql = "INSERT INTO 'order' (OrderID, OrderDate, OrderTime, CustomerID, DeliveryType)
VALUES ('$_SESSION['counter']', date("Y/m/d"), date("h:i:sa"), $_SESSION['counter'], '$_POST['DeliveryType']')";
$sql = "INSERT INTO 'orderitems' (OrderID, FoodID, Crust, Sauce)
VALUES ('$_SESSION['counter']', '$_SESSION['counter']', '$_POST['Crust']', '$_POST['Sauce']')";


if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>