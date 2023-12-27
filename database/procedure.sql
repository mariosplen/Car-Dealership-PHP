DELIMITER //

CREATE PROCEDURE InsertCar(
    IN car_ID CHAR(4),
    IN car_Model VARCHAR(45),
    IN car_Weight INT,
    IN car_Color VARCHAR(12),
    IN car_Price FLOAT,
    IN category_ID INT,
    IN manufacturer_ID INT
)
BEGIN
    INSERT INTO Car(ID, Model, Weight, Color, Price, Category_ID, Manufacturer_ID)
    VALUES (car_ID, car_Model, car_Weight, car_Color, car_Price, category_ID, manufacturer_ID);
END//

DELIMITER ;