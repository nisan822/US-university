
SELECT  Date_ID, Student_ID, SUM(Course_Grade * Course_Credit_Points) / SUM(Course_Credit_Points) AS final_grade,
CASE
	WHEN (SUM(Course_Grade * Course_Credit_Points) / SUM(Course_Credit_Points)) >
                 (SELECT  Avg_Grade_For_Certificate
                  FROM       Mng_Grade_For_Certificate
                  WHERE    Year = LEFT(CAST(Date_ID AS varchar), 4)) THEN 1 ELSE 0 END AS IsCertificate_Ind
FROM      dbo.DWH_Fact_Student_Course_Grades
GROUP BY Date_ID, Student_ID;