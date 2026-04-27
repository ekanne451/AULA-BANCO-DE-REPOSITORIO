SELECT Name, Milliseconds
FROM Track
WHERE Milliseconds BETWEEN 240000 AND 360000
ORDER BY Milliseconds DESC;