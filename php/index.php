<?php
$host = 'db';
$user = 'root';
$pass = 'root';
$conn = new mysqli($host, $user, $pass, "dealership");
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$category_query = "SELECT ID, Name FROM Category";
$category_result = $conn->query($category_query);

// Fetch manufacturers from Manufacturer table
$manufacturer_query = "SELECT ID, Name FROM Manufacturer";
$manufacturer_result = $conn->query($manufacturer_query);
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>

  <style>
 

  </style>
</head>

<body>
  <div class="table-container">
    <table border="2" class="table">
      <tr>
        <td>
          <h2>Add Category</h2>
          <form action="insert_category.php" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br><br>

            <label for="number_of">Number Of:</label>
            <input type="number" id="number" name="number" required><br><br>

            <input type="submit" value="Submit">
          </form>
        </td>

        <td>
          <h2>Add Manufacturer</h2>
          <form action="insert_manufacturer.php" method="post">
            <label for="name">Name:</label>
            <input type="text" id="man_name" name="man_name" required><br><br>

            <label for="country">Country:</label>
            <input type="text" id="country" name="country" required><br><br>

            <input type="submit" value="Submit">
          </form>
        </td>

        <td>
          <h2>Add car</h2>
          <form action="insert_car.php" method="post">

            <label for="id">Id:</label>
            <input type="text" id="id" name="id" required><br><br>

            <label for="model">Model:</label>
            <input type="text" id="model" name="model" required><br><br>

            <label for="weight">weight:</label>
            <input type="number" id="weight" name="weight" required><br><br>

            <label for="color">color:</label>
            <input type="text" id="color" name="color" required><br><br>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" required><br><br>


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
        </td>
      </tr>

      <tr>
        <td>

          <table border="1">
            <tr>
              <th>ID</th>
              <th>Name</th>

              <th>Number_Of</th>
              <th>Actions</th>

            </tr>
            <?php


            $category_query = "SELECT ID, Name, Number_Of FROM Category";
            $category_result = $conn->query($category_query);

            if ($category_result->num_rows > 0) {
              while ($row = $category_result->fetch_assoc()) {

                echo "<tr>";
                echo "<td>" . $row['ID'] . "</td>";
                echo "<td>" . $row['Name'] . "</td>";
                echo "<td>" . $row['Number_Of'] . "</td>";


                echo "<td>
                        <a class='btn btn-update' href='update_category_form.php?id=" . $row['ID'] . "'>Update</a>
                        <a class='btn btn-delete' href='delete.php?id=" . $row['ID'] . "&item=Category'>Delete</a>
                      </td>";
                echo "</tr>";
              }
            } else {
              echo "<tr><td colspan='3'>No categories found</td></tr>";
            }
            ?>
          </table>
        </td>
        <td>
          <table border="1">
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Country</th>
              <th>Actions</th>
            </tr>
            <?php
            $manufacturer_query = "SELECT ID, Name, Country FROM Manufacturer";
            $manufacturer_result = $conn->query($manufacturer_query);

            if ($manufacturer_result->num_rows > 0) {
              while ($row = $manufacturer_result->fetch_assoc()) {

                echo "<tr>";
                echo "<td>" . $row['ID'] . "</td>";
                echo "<td>" . $row['Name'] . "</td>";
                echo "<td>" . $row['Country'] . "</td>";


                echo "<td>
                        <a class='btn btn-update' href='update_manufacturer_form.php?id=" . $row['ID'] . "'>Update</a>
                        <a class='btn btn-delete' href='delete.php?id=" . $row['ID'] . "&item=Manufacturer'>Delete</a>
                      </td>";
                echo "</tr>";
              }
            } else {
              echo "<tr><td colspan='3'>No categories found</td></tr>";
            }
            ?>


          </table>

        </td>
        <td>
          <table border="1">
            <tr>
              <th>ID</th>
              <th>Category</th>
              <th>Manufacturer</th>
              <th>Model</th>
              <th>Weight</th>
              <th>Color</th>
              <th>Price</th>
              <th>Actions</th>
            </tr>
            <?php
            $car_query = "SELECT Manufacturer.Name AS Manufacturer_Name, Category.Name AS Category_Name, Car.ID, Car.Model, Car.Weight, Car.Color, Car.Price
          FROM Car
          LEFT JOIN Manufacturer ON Car.Manufacturer_ID = Manufacturer.ID
          LEFT JOIN Category ON Car.Category_ID = Category.ID";
            $car_result = $conn->query($car_query);

            if ($car_result->num_rows > 0) {
              while ($row = $car_result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row['ID'] . "</td>";
                echo "<td>" . $row['Category_Name'] . "</td>";
                echo "<td>" . $row['Manufacturer_Name'] . "</td>";
                echo "<td>" . $row['Model'] . "</td>";
                echo "<td>" . $row['Weight'] . "</td>";
                echo "<td>" . $row['Color'] . "</td>";
                echo "<td>" . $row['Price'] . "</td>";




                echo "<td>
                        <a class='btn btn-update' href='update_car_form.php?id=" . $row['ID'] . "'>Update</a>
                        <a class='btn btn-delete' href='delete.php?id=" . $row['ID'] . "&item=Car'>Delete</a>
                      </td>";
                echo "</tr>";
              }
            } else {
              echo "<tr><td colspan='3'>No categories found</td></tr>";
            }
            ?>


          </table>



        </td>


      </tr>

    </table>
  </div>

</body>

</html>