SELECT 
    Customers.CustomerID,
    Customers.CustomerName,
    Cities.CityName,
    StateProvinces.StateProvinceName,
    Countries.CountryName,
    SUM(OrderLines.Quantity * OrderLines.UnitPrice) AS TotalSales  -- Calculating sales amount
FROM Sales.Customers AS Customers
JOIN Application.Cities AS Cities
    ON Customers.PostalCityID = Cities.CityID  -- Link Customers to Cities
JOIN Application.StateProvinces AS StateProvinces
    ON Cities.StateProvinceID = StateProvinces.StateProvinceID  -- Link Cities to StateProvinces
JOIN Application.Countries AS Countries
    ON StateProvinces.CountryID = Countries.CountryID  -- Link StateProvinces to Countries
JOIN Sales.Orders AS Orders
    ON Customers.CustomerID = Orders.CustomerID  -- Link Customers to Orders
JOIN Sales.OrderLines AS OrderLines
    ON Orders.OrderID = OrderLines.OrderID  -- Link Orders to OrderLines
where StateProvinces.StateProvinceName IN ('New York', 'Virginia', 'Pennsylvania', 'Florida', 'Ohio', 'Georgia', 'North Carolina')  -- Filter for the 7 biggest Eastern states
GROUP BY 
    Customers.CustomerID,
    Customers.CustomerName,
    Cities.CityName,
    StateProvinces.StateProvinceName,
    Countries.CountryName
ORDER BY TotalSales DESC;
