SELECT *
FROM Books
WHERE BookID IN (
    SELECT DISTINCT BookID
    FROM Loans
    WHERE DateReturned IS NULL
      AND DueDate < DATEADD(DAY, -30, GETDATE())
);
