<?php
$host = 'db';
$user = 'root';
$pass = 'root';
$conn = new mysqli($host, $user, $pass, "dealership");
if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
} else{
  
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $man_name = $_POST['man_name'];
    $country = $_POST['country'];

    $sql = "INSERT INTO  Manufacturer(Name, Country) VALUES ('$man_name', '$country')";

    if ($conn->query($sql) === TRUE) {
        header('Location: / ');
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}


?>