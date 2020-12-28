





  select cast(cast(de.Year AS varchar) + '0101' As int) As Date_ID,de.DepartmentID AS Department_ID, de.FixCosts AS Fix_Costs,
  de.MarketingCosts AS Marketing_Costs,(de.TeacherAnualSalary*v.NumofInstructors) AS Instructors_Costs,
 (de.FixCosts + de.MarketingCosts+(de.TeacherAnualSalary*v.NumofInstructors)) AS Total_Costs, vv.Income, d.Budget,
 (vv.Income-(de.FixCosts + de.MarketingCosts+(de.TeacherAnualSalary*v.NumofInstructors))) AS Profit
  from [School].[dbo].[Department_Expensess] de
  left join [US_University_DWH].[dbo].[V_STG_Calc_NumOfInstructors_In_Dep] v
  on de.DepartmentID = v.DepartmentID
  left join [US_University_DWH].[dbo].[V_STG_Calc_Income_Per_Dep] vv
  on de.DepartmentID = vv.DepartmentID and de.Year = vv.Year
  left join [School].[dbo].[Department] d
  on de.DepartmentID = d.DepartmentID  

