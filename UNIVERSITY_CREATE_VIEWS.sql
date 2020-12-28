create view V_STG_Calc_NumOfInstructors_In_Dep AS

SELECT dep.DepartmentID DepartmentID,SUM(count_course.Instructor_Count_Course) NumofInstructors from (
select CourseID,count(PersonID) AS Instructor_Count_Course 
from [School].[dbo].[CourseInstructor]
group by CourseID)count_course
join [School].[dbo].Course co 
on co.CourseID = count_course.CourseID 
join [School].[dbo].Department dep 
on dep.DepartmentID = co.DepartmentID
group by dep.DepartmentID






alter view V_STG_Calc_Income_Per_Dep AS
select ea.Year,ea.DepartmentID,sum(ea.Yearly_Income) AS Income from
(
SELECT sg.Year,dep.DepartmentID,co.Price*count(distinct sg.StudentID) as Yearly_Income
FROM [School].[dbo].[Course] co right join [School].[dbo].[Student_Grades] sg
on co.CourseID = sg.CourseID
right join [School].[dbo].[Department] dep
on co.DepartmentID = dep.DepartmentID
group by sg.Year,co.Price,dep.DepartmentID)ea
group by ea.Year,ea.DepartmentID;



alter view V_Final_Grades AS
SELECT  Date_ID, Student_ID, SUM(Course_Grade * Course_Credit_Points) / SUM(Course_Credit_Points) AS final_grade,
CASE
	WHEN (SUM(Course_Grade * Course_Credit_Points) / SUM(Course_Credit_Points)) >=
                 (SELECT  Avg_Grade_For_Certificate
                  FROM       [US_University_DWH].dbo.Mng_Grade_For_Certificate
                  WHERE    Year = LEFT(CAST(Date_ID AS varchar), 4)) THEN 1 ELSE 0 END AS IsCertificate_Ind
FROM      [US_University_DWH].[dbo].[STG_Fact_Student_Course_Grades]
GROUP BY Date_ID, Student_ID;