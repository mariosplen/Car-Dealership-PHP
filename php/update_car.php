<?php
$host = 'db';
$user = 'root';
$pass = 'root';
$conn = new mysqli($host, $user, $pass, "dealership");
if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
} else{
  
}


    $old_id = $_GET['old_id'];
    $id= $_POST['id'];
    $model= $_POST['model'];
    $weight= $_POST['weight'];
    $color= $_POST['color'];
    $price = $_POST['price'];
    $category = $_POST['category'];
    $manufacturer = $_POST['manufacturer'];
   

    $sql = "UPDATE Car SET ID = '$id' , Model = '$model', Weight = '$weight', Color = '$color', Price = $price, Category_ID = $category, Manufacturer_ID = $manufacturer WHERE ID = '$old_id'";

    if ($conn->query($sql) === TRUE) {
        header('Location: / ');


        
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    
}


?>