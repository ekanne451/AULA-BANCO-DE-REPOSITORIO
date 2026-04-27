SELECT *
FROM Invoice
WHERE Total > 5.00
AND strftime('%Y', InvoiceDate) = '2013';