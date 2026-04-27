SELECT FirstName, LastName, Country
FROM Customer
WHERE Country IN ('Brazil', 'Canada', 'France')
ORDER BY LastName ASC;