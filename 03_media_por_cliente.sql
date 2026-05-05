SELECT AVG(TotalPorCliente) AS MediaPorCliente
FROM (
    SELECT SUM(i.Total) AS TotalPorCliente
    FROM Invoice i
    GROUP BY i.CustomerId
) sub;