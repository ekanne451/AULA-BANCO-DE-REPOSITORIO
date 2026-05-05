SELECT g.Name, SUM(il.UnitPrice * il.Quantity) AS Receita
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
HAVING SUM(il.UnitPrice * il.Quantity) > (
    SELECT AVG(Receita)
    FROM (
        SELECT SUM(il.UnitPrice * il.Quantity) AS Receita
        FROM InvoiceLine il
        JOIN Track t ON il.TrackId = t.TrackId
        GROUP BY t.GenreId
    ) sub
);