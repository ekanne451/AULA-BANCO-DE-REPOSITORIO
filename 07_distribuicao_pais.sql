SELECT BillingCountry, COUNT(*) AS Quantidade, SUM(Total) AS Total
FROM Invoice
WHERE Total > (SELECT AVG(Total) FROM Invoice)
GROUP BY BillingCountry
HAVING COUNT(*) > 1;