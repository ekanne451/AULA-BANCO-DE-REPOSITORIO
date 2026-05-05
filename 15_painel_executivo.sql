SELECT
    (SELECT c.FirstName || ' ' || c.LastName
     FROM Customer c
     JOIN Invoice i ON c.CustomerId = i.CustomerId
     GROUP BY c.CustomerId
     ORDER BY SUM(i.Total) DESC
     LIMIT 1) AS MelhorCliente,

    (SELECT g.Name
     FROM InvoiceLine il
     JOIN Track t ON il.TrackId = t.TrackId
     JOIN Genre g ON t.GenreId = g.GenreId
     GROUP BY g.Name
     ORDER BY SUM(il.UnitPrice * il.Quantity) DESC
     LIMIT 1) AS MelhorGenero;