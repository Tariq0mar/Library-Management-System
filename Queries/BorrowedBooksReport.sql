CREATE PROCEDURE sp_BorrowedBooksReport
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT
        L.LoanID,
        B.Title AS BookTitle,
        B.Author,
        BR.FirstName + ' ' + BR.LastName AS BorrowerName,
        L.DateBorrowed,
        L.DueDate,
        L.DateReturned
    FROM Loans L
    JOIN Books B ON L.BookID = B.BookID
    JOIN Borrowers BR ON L.BorrowerID = BR.BorrowerID
    WHERE L.DateBorrowed BETWEEN @StartDate AND @EndDate
    ORDER BY L.DateBorrowed;
END;
