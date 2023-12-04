SELECT Customer.ID, Sale.Car_ID FROM Customer INNER JOIN Sale ON Sale.Customer_ID = Customer.ID;

SELECT Spare_Part.Name, Count(Sale_Misc.Salesperson_ID) FROM Spare_Part LEFT JOIN Sale_Misc on Spare_Part.ID = Sale_Misc.Spare_Part_ID GROUP BY Spare_Part.Name;