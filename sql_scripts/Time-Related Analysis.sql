SELECT 
    YEAR(Orders.OrderDate) AS Year,
    StateProvinces.StateProvinceName,
    SUM(OrderLines.Quantity * OrderLines.UnitPrice) AS TotalSales,
    LAG(SUM(OrderLines.Quantity * OrderLines.UnitPrice)) OVER (PARTITION BY StateProvinces.StateProvinceName ORDER BY YEAR(Orders.OrderDate)) AS LastYearSales,
    SUM(OrderLines.Quantity * OrderLines.UnitPrice) - LAG(SUM(OrderLines.Quantity * OrderLines.UnitPrice)) OVER (PARTITION BY StateProvinces.StateProvinceName ORDER BY YEAR(Orders.OrderDate)) AS YoYChange,
    (SUM(OrderLines.Quantity * OrderLines.UnitPrice) - LAG(SUM(OrderLines.Quantity * OrderLines.UnitPrice)) OVER (PARTITION BY StateProvinces.StateProvinceName ORDER BY YEAR(Orders.OrderDate))) / 
    LAG(SUM(OrderLines.Quantity * OrderLines.UnitPrice)) OVER (PARTITION BY StateProvinces.StateProvinceName ORDER BY YEAR(Orders.OrderDate)) * 100 AS YoYPercentageChange
FROM Sales.Orders AS Orders
JOIN Sales.OrderLines AS OrderLines
    ON Orders.OrderID = OrderLines.OrderID
JOIN Sales.Customers AS Customers
    ON Orders.CustomerID = Customers.CustomerID  -- Link Orders to Customers
JOIN Application.Cities AS Cities
    ON Customers.PostalCityID = Cities.CityID  -- Link them to Cities
JOIN Application.StateProvinces AS StateProvinces
    ON Cities.StateProvinceID = StateProvinces.StateProvinceID  -- Link to StateProvinces
JOIN Application.Countries AS Countries
    ON StateProvinces.CountryID = Countries.CountryID  -- Link to Countries
WHERE StateProvinces.StateProvinceName IN ('New York', 'Virginia', 'Pennsylvania', 'Florida', 'Ohio', 'Georgia', 'North Carolina')
GROUP BY YEAR(Orders.OrderDate), StateProvinces.StateProvinceName
ORDER BY StateProvinces.StateProvinceName, Year;
