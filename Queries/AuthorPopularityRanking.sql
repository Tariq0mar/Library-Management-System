SELECT 
    RANK() OVER (ORDER BY COUNT(L.LoanID) DESC) AS AuthorRank,
    B.Author,
    COUNT(L.LoanID) AS TotalBorrowed
FROM 
    Loans L
JOIN 
    Books B ON L.BookID = B.BookID
GROUP BY 
    B.Author
ORDER BY 
    AuthorRank;
