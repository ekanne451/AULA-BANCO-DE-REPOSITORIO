SELECT i.InvoiceId, c.FirstName || ' ' || c.LastName AS Cliente, i.Total
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
WHERE i.Total > (SELECT AVG(Total) FROM Invoice);