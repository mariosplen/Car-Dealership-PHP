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


$manufacturer_query = "SELECT * FROM Manufacturer WHERE ID = $id";
$manufacturer_result = $conn->query($manufacturer_query);

if ($manufacturer_result->num_rows > 0) {

    $row = mysqli_fetch_assoc($manufacturer_result);

    echo "<h2>Edit Manufacturer with id : " . $row['ID'] . "</h2>";
    echo "<form action='update_manufacturer.php/?id=" . $row['ID'] . "' method='post'>";
    echo '  <label for="name">Name:</label>';
    echo '  <input type="text" required id="name" name="name" value=' . $row['Name'] . '><br><br>';
    echo '  <label for="country">Country:</label>';
    echo '  <input type="text" required id="country" name="country" value=' . $row['Country'] . '><br><br>';
    echo '  <input type="submit" value="Submit">';
    echo '</form>';


} else {
    echo "Error: " . $sql . "<br>" . $conn->error;

}


?>