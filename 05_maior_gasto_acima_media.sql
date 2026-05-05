SELECT MAX(TotalGasto) AS MaiorGasto
FROM (
    SELECT SUM(Total) AS TotalGasto
    FROM Invoice
    GROUP BY CustomerId
    HAVING SUM(Total) > (
        SELECT AVG(TotalPorCliente)
        FROM (
            SELECT SUM(Total) AS TotalPorCliente
            FROM Invoice
            GROUP BY CustomerId
        ) sub
    )
) sub2;