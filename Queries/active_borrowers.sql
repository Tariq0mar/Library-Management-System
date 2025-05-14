-- Active Borrowers with CTEs: Identify borrowers who've borrowed 2 or more books but haven't returned any using CTEs.

DECLARE @MinBorrowedCount INT;
SET @MinBorrowedCount = 2;

WITH ActiveBorrowersCTE AS (
    SELECT 
        BorrowerID,
        COUNT(*) AS BorrowedCount
    FROM Loans
    WHERE DateReturned IS NULL
    GROUP BY BorrowerID
)
SELECT 
    B.BorrowerID,
    B.FirstName,
    B.LastName,
    B.Email,
    A.BorrowedCount
FROM ActiveBorrowersCTE A
JOIN Borrowers B ON A.BorrowerID = B.BorrowerID
WHERE A.BorrowedCount >= @MinBorrowedCount;