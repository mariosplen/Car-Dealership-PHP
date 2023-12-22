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

$category_query = "SELECT ID, Name FROM Category";
$category_result = $conn->query($category_query);

// Fetch manufacturers from Manufacturer table
$manufacturer_query = "SELECT ID, Name FROM Manufacturer";
$manufacturer_result = $conn->query($manufacturer_query);

$car_query = 
"SELECT Manufacturer.Name AS Manufacturer_Name, Category.Name AS Category_Name, Car.ID, Car.Model, Car.Weight, Car.Color, Car.Price
FROM Car 
LEFT JOIN Manufacturer ON Car.Manufacturer_ID = Manufacturer.ID
LEFT JOIN Category ON Car.Category_ID = Category.ID WHERE Car.ID = '$id'";
$car_result = $conn->query($car_query);

$car = mysqli_fetch_assoc($car_result);


?>



<h2>Edit car</h2>
<form action="update_car.php/?old_id=<?php echo $id ?>" method="post">

    <label for="id">Id:</label>
    <input type="text" id="id" required name="id" value= <?php echo $car['ID'] ?> ><br><br>

    <label for="model">Model:</label>
    <input type="text" id="model" name="model" value = <?php echo $car['Model'] ?>  required><br><br>

    <label for="weight">weight:</label>
    <input type="number" id="weight" name="weight" value = <?php echo $car['Weight'] ?> required><br><br>

    <label for="color">color:</label>
    <input type="text" id="color" name="color" value = <?php echo $car['Color'] ?> required><br><br>

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" value = <?php echo $car['Price'] ?> required><br><br>


    Category:
    <select name="category">
        <?php
        if ($category_result->num_rows > 0) {
            while ($row = $category_result->fetch_assoc()) {
                echo "<option value='" . $row['ID'] . "'>" . $row['Name'] . "</option>";
            }
        }
        ?>
    </select><br><br>

    Manufacturer:
    <select name="manufacturer">
        <?php
        if ($manufacturer_result->num_rows > 0) {
            while ($row = $manufacturer_result->fetch_assoc()) {
                echo "<option value='" . $row['ID'] . "'>" . $row['Name'] . "</option>";
            }
        }
        ?>
    </select><br><br>
    <input type="submit" value="Submit">
</form>