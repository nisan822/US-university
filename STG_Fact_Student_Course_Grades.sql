 select cast(cast(sg.Year AS varchar) + '0101' As int) As Date_ID, sg.StudentID,sg.CourseID,max(sg.Grade) AS Course_Grade,
  co.DepartmentID AS Department_ID, co.Credits AS Course_Credit_Points,case 
		when MAX(sg.grade)>= cgr.Grade then 1
		when max (sg.grade)< cgr.Grade then 0
		else Null
		end as Course_Pass_Ind
  from [School].[dbo].[Student_Grades] sg 
  left join [School].[dbo].[Course] co
  on sg.CourseID = co.CourseID
  left join  [School].[dbo].[Course_Grade_Requirements] cgr
  on sg.CourseID = cgr.CourseID and sg.Year = cgr.Year
  group by sg.StudentID,sg.CourseID,cast(cast(sg.Year AS varchar) + '0101' As int),co.DepartmentID, co.Credits,cgr.Grade


