<?php
$host = 'db';
$user = 'root';
$pass = 'root';
$conn = new mysqli($host, $user, $pass);
if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
} 

?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>


    <h2>Add Category</h2>
    <form action="insert_category.php" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        
        <label for="number_of">Number Of:</label>
        <input type="number" id="number_of" name="number_of" required><br><br>
        
        <input type="submit" value="Submit">
    </form>
  </body>
</html>
