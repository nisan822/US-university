DROP DATABASE IF EXISTS US_University_DWH;
CREATE DATABASE IF NOT EXISTS US_University_DWH; 
go
USE US_University_DWH;
go

DROP TABLE IF EXISTS STG_Dim_Students,
					 STG_Dim_Courses,
					 STG_Dim_Departments,
					 STG_Intermediate_Course_Instructor,
					 STG_Dim_Instructors,
					 STG_Fact_Student_Course_Grades,
					 STG_Fact_Finance,
					 MNG_Grade_For_Certificate




CREATE TABLE STG_Dim_Students(
	Student_ID INT,
	Student_Name VARCHAR(50),
	Student_Gender CHAR(1),
	Student_Country VARCHAR(100),
	Student_City VARCHAR(100),
	Student_Region VARCHAR(100),
	Student_Street VARCHAR(500),
	Student_Age INT, 
	Study_Year INT

);

CREATE TABLE STG_Dim_Courses(
	Course_ID INT,
	Course_Name VARCHAR(50),
	Course_Credit_Points INT,
	Course_Price INT,
	Is_Online_Ind BIT,
	Course_Location VARCHAR(50),
	Department_ID INT,
	Department_Name VARCHAR(50)

);

CREATE TABLE STG_Dim_Departments(
	Department_ID INT,
	Department_Name VARCHAR(50)

);

CREATE TABLE STG_Intermediate_Course_Instructor (
	Course_ID INT,
	Instructor_ID INT
);

CREATE TABLE STG_Dim_Instructors (
	Instructor_ID INT,
	Instructor_Name  VARCHAR(50),
	Instructor_Gender CHAR(1),
	Instructor_Seniority INT

);

CREATE TABLE STG_Fact_Student_Course_Grades (
	Date_ID INT,
	Student_ID INT,
	Course_ID INT,
	Department_ID INT,
	Course_Grade INT,
	Course_Credit_Points INT,
	Course_Pass_Ind BIT
);

CREATE TABLE STG_Fact_Finance (
	Date_ID INT,
	Department_ID INT,
	Fix_Costs INT,
	Marketing_Costs INT, 
	Instructors_Costs INT,
	Total_Costs INT,
	Income INT,
	Budget INT,
	Profit INT


);

CREATE TABLE MNG_Grade_For_Certificate (
	Year INT,
	Avg_Grade_For_Certificate INT
);

INSERT INTO MNG_Grade_For_Certificate
VALUES(2015, 65),
	  (2016, 65),
	  (2017, 65),
	  (2018, 70),
	  (2019, 70);





