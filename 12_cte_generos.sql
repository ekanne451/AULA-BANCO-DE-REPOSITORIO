WITH ReceitaGenero AS (
    SELECT g.Name, SUM(il.UnitPrice * il.Quantity) AS Receita
    FROM InvoiceLine il
    JOIN Track t ON il.TrackId = t.TrackId
    JOIN Genre g ON t.GenreId = g.GenreId
    GROUP BY g.Name
)
SELECT *
FROM ReceitaGenero
WHERE Receita > (SELECT AVG(Receita) FROM ReceitaGenero);