CREATE VIEW `car_sales_view` AS  
    SELECT Car.Model, Car.Weight, Car.Price , Manufacturer.Name,Manufacturer.Country, count(Sale.ID) FROM Car INNER JOIN Manufacturer ON Car.Manufacturer_ID = Manufacturer.ID INNER JOIN Sale on Car.ID = Sale.Car_ID GROUP BY Car.ID;
    

