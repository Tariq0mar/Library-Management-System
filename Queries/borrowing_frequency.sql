-- Borrowing Frequency using Window Functions: Rank borrowers based on borrowing frequency.

SELECT 
    B.BorrowerID,
    B.FirstName,
    B.LastName,
    B.Email,
    COUNT(L.LoanID) AS TotalBorrowed,
    RANK() OVER (ORDER BY COUNT(L.LoanID) DESC) AS BorrowingRank
FROM Loans L
JOIN Borrowers B ON L.BorrowerID = B.BorrowerID
GROUP BY B.BorrowerID, B.FirstName, B.LastName, B.Email;