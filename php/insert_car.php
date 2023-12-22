<?php
$host = 'db';
$user = 'root';
$pass = 'root';
$conn = new mysqli($host, $user, $pass, "dealership");
if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
} else{
  
}

$model = $_POST['model'];
    $id = $_POST['id'];

    $weight = $_POST['weight'];
    $color = $_POST['color'];
    $price = $_POST['price'];
    $categoryID = $_POST['category'];
    $manufacturerID = $_POST['manufacturer'];

    // Inserting data into the Car table
    $sql = "INSERT INTO Car (ID, Model, Weight, Color, Price, Category_ID, Manufacturer_ID) VALUES ('$id', '$model', $weight, '$color', $price, $categoryID, $manufacturerID)";

    if ($conn->query($sql) === TRUE) {
        header('Location: / ');
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }


?>