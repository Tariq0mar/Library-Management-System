DECLARE @TargetMonth INT = 4;
DECLARE @TargetYear INT = 2025;

WITH GenreCount AS (
    SELECT
        B.Genre,
        COUNT(*) AS BorrowCount,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS GenreRank
    FROM Loans L
    INNER JOIN Books B ON L.BookID = B.ID
    WHERE MONTH(L.DateBorrowed) = @TargetMonth
      AND YEAR(L.DateBorrowed) = @TargetYear
    GROUP BY B.Genre
)

SELECT Genre, BorrowCount
FROM GenreCount
WHERE GenreRank = 1;
