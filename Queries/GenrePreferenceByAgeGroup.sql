WITH BorrowerAgeGroups AS (
    SELECT 
        b.BorrowerID,
        DATEDIFF(YEAR, b.DateOfBirth, GETDATE()) AS Age,
        CASE 
            WHEN DATEDIFF(YEAR, b.DateOfBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
            WHEN DATEDIFF(YEAR, b.DateOfBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
            WHEN DATEDIFF(YEAR, b.DateOfBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
            WHEN DATEDIFF(YEAR, b.DateOfBirth, GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
            WHEN DATEDIFF(YEAR, b.DateOfBirth, GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
            ELSE '50+' 
        END AS AgeGroup
    FROM Borrowers b
),
GenreCounts AS (
    SELECT 
        bag.AgeGroup,
        bo.Genre,
        COUNT(*) AS BorrowCount
    FROM BorrowerAgeGroups bag
    JOIN Loans l ON bag.BorrowerID = l.BorrowerID
    JOIN Books bo ON l.BookID = bo.BookID
    GROUP BY bag.AgeGroup, bo.Genre
),
RankedGenres AS (
    SELECT *,
        RANK() OVER (PARTITION BY AgeGroup ORDER BY BorrowCount DESC) AS rnk
    FROM GenreCounts
)
SELECT AgeGroup, Genre, BorrowCount
FROM RankedGenres
WHERE rnk = 1
ORDER BY AgeGroup;
