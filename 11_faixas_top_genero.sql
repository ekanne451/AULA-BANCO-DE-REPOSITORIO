SELECT t.Name, t.UnitPrice
FROM Track t
WHERE t.GenreId = (
    SELECT t2.GenreId
    FROM InvoiceLine il
    JOIN Track t2 ON il.TrackId = t2.TrackId
    GROUP BY t2.GenreId
    ORDER BY SUM(il.UnitPrice * il.Quantity) DESC
    LIMIT 1
);