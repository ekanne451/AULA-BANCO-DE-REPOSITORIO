SELECT g.Name AS Genero, SUM(il.UnitPrice * il.Quantity) AS Receita
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Receita DESC;