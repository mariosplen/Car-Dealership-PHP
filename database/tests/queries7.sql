CREATE view `car_sales_view`
AS
  SELECT Car.model,
         Car.weight,
         Car.price,
         Manufacturer.name,
         Manufacturer.country,
         Count(Sale.id)
  FROM   Car
         INNER JOIN Manufacturer
                 ON Car.manufacturer_id = Manufacturer.id
         INNER JOIN Sale
                 ON Car.id = Sale.car_id
  GROUP  BY Car.id; 


SELECT  * FROM car_sales_view;

