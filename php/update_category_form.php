<?php
$host = 'db';
$user = 'root';
$pass = 'root';
$conn = new mysqli($host, $user, $pass, "dealership");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {

}


$id = $_GET['id'];


$category_query = "SELECT * FROM Category WHERE ID = $id";
$category_result = $conn->query($category_query);

if ($category_result->num_rows > 0) {
    $row = mysqli_fetch_assoc($category_result);

    echo "<h2>Edit Category with id : " . $row['ID'] . "</h2>";
    echo "<form action='update_category.php/?id=" . $row['ID'] . "' method='post'>";
    echo '<label for="name">Name:</label>';
    echo '<input type="text"  id="name" name="name" value=' . $row['Name'] . '><br><br>';
    echo '';
    echo '';
    echo '<input type="submit" value="Submit">';






} else {
    echo "Error: " . $sql . "<br>" . $conn->error;

}


?>



