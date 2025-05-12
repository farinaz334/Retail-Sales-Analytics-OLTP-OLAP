SELECT 
    StateProvinces.StateProvinceName,
    FORMAT(SUM(OrderLines.Quantity * OrderLines.UnitPrice), 'N2') AS TotalRevenue  -- Comma Formatting revenue 
FROM Sales.Customers AS Customers
JOIN Application.Cities AS Cities
    ON Customers.PostalCityID = Cities.CityID  -- Link Customers to Cities
JOIN Application.StateProvinces AS StateProvinces
    ON Cities.StateProvinceID = StateProvinces.StateProvinceID  -- Link all to StateProvinces
JOIN Application.Countries AS Countries
    ON StateProvinces.CountryID = Countries.CountryID  
JOIN Sales.Orders AS Orders
    ON Customers.CustomerID = Orders.CustomerID  -- Link them to Orders
JOIN Sales.OrderLines AS OrderLines
    ON Orders.OrderID = OrderLines.OrderID  -- Link Orders to OrderLines
WHERE StateProvinces.StateProvinceName IN ('New York', 'Virginia', 'Pennsylvania', 'Florida', 'Ohio', 'Georgia', 'North Carolina')  -- Filter for 7 biggest Eastern states
GROUP BY StateProvinces.StateProvinceName
ORDER BY TotalRevenue DESC;
