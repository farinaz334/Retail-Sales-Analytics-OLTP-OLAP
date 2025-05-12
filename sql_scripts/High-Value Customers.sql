SELECT 
    Customers.CustomerID,
    Customers.CustomerName,
    CustomerCategories.CustomerCategoryName,
    SUM(CustomerTransactions.TransactionAmount) AS TotalSpent,
    COUNT(CustomerTransactions.CustomerTransactionID) AS TotalTransactions
FROM Sales.Customers AS Customers
JOIN Sales.CustomerCategories AS CustomerCategories
    ON Customers.CustomerCategoryID = CustomerCategories.CustomerCategoryID  -- Link to Customer Categories
JOIN Sales.CustomerTransactions AS CustomerTransactions
    ON Customers.CustomerID = CustomerTransactions.CustomerID  -- Link to Customer Transactions
JOIN Application.Cities AS Cities
    ON Customers.PostalCityID = Cities.CityID  -- Link Customers to Cities
JOIN Application.StateProvinces AS StateProvinces
    ON Cities.StateProvinceID = StateProvinces.StateProvinceID  -- Link with StateProvinces
JOIN Application.Countries AS Countries
    ON StateProvinces.CountryID = Countries.CountryID  -- Link StateProvinces to Countries
WHERE StateProvinces.StateProvinceName IN ('New York', 'Virginia', 'Pennsylvania', 'Florida', 'Ohio', 'Georgia', 'North Carolina')
GROUP BY 
    Customers.CustomerID, 
    Customers.CustomerName,
    CustomerCategories.CustomerCategoryName
HAVING SUM(CustomerTransactions.TransactionAmount) > 1000  -- Customers who spent more than $1,000 Q
ORDER BY TotalSpent DESC;
