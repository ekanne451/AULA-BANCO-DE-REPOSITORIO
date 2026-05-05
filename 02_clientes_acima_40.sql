SELECT c.CustomerId, c.FirstName || ' ' || c.LastName AS Nome, SUM(i.Total) AS TotalGasto
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
HAVING SUM(i.Total) > 40
ORDER BY TotalGasto DESC;