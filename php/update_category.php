<?php
$host = 'db';
$user = 'root';
$pass = 'root';
$conn = new mysqli($host, $user, $pass, "dealership");
if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
} else{
  
}


    $id = $_GET['id'];
    $name= $_POST['name'];
   

    $sql = "UPDATE Category SET Name = '$name' WHERE ID = '$id'";

    if ($conn->query($sql) === TRUE) {
        header('Location: / ');


        
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    
}


?>