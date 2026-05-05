WITH ReceitaGenero AS (
    SELECT t.GenreId, g.Name, SUM(il.UnitPrice * il.Quantity) AS Receita
    FROM InvoiceLine il
    JOIN Track t ON il.TrackId = t.TrackId
    JOIN Genre g ON t.GenreId = g.GenreId
    GROUP BY t.GenreId, g.Name
),
TopGenero AS (
    SELECT GenreId
    FROM ReceitaGenero
    ORDER BY Receita DESC
    LIMIT 1
)
SELECT t.Name, t.UnitPrice
FROM Track t
JOIN TopGenero tg ON t.GenreId = tg.GenreId;