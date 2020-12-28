DROP PROCEDURE US_University_DWH
use US_University_DWH

Create PROCEDURE Dim_Dates
AS
Begin

declare @MaxDate date = '2019-12-31'
declare @MinDate date = '2015-01-01'

DROP TABLE IF EXISTS DWH_Dim_Dates

create table DWH_Dim_Dates(
Date_ID int,
Full_Date Date,
Year int, 
Current_Year_Ind int,


);

while @MinDate <= @MaxDate

	begin
		insert into DWH_Dim_Dates(Date_ID, Full_Date, Year, Current_Year_Ind)
		values(cast(format(@MinDate,'yyyyMMdd') as int),
		format(@MinDate,'yyyy-MM-dd'),
		year(@MinDate),
		 CASE --current year ind
		 when year(@MinDate)=year(@MaxDate)then 1 
		 when year(@MinDate)= '2018' then 2
		 else 0
		 end
		)
		
		set @MinDate = dateadd(year,1,@MinDate)
	End

End
exec Dim_Dates

SELECT * FROM DWH_Dim_Dates