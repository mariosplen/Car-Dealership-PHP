SELECT Salesperson_ID, count(Car_ID) FROM Sale GROUP BY Salesperson_ID;

SELECT Max(Price), Category_ID FROM Car GROUP BY Category_ID;