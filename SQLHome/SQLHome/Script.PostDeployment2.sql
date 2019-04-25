/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

USE [SQLHome];
PRINT('PostDeployment Script')

IF(EXISTS(SELECT * FROM [Students]))
BEGIN
	PRINT N'Create [dbo].[Students]'
	DROP TABLE Students
	CREATE TABLE [dbo].[Students]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
		[FirstName] VARCHAR(50) NULL, 
		[LastName] VARCHAR(50) NULL,
		[Email] VARCHAR(MAX) NOT NULL
	)
	PRINT N'Insert data into [dbo].[Students]'
	INSERT INTO [dbo].[Students] (FirstName, LastName, Email)
	VALUES
		("Igor", "Dyachenko", "igordyacserg@bk.ru"),
		("TestName1", "TestLastName1", "testemail@bk.ru1"),
		("TestNamew", "TestLastName1", "testemail@bk.ru2");
END

IF(EXISTS(SELECT * FROM [Works]))
BEGIN
	PRINT N'Create [dbo].[Works]'
	DROP TABLE Works
	CREATE TABLE [dbo].[Works]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
		[WorkName] VARCHAR(MAX) NOT NULL, 
		[Description] TEXT NULL, 
		[MaxGrade] INT NOT NULL
	)
	PRINT N'Insert data into [dbo].[Works]'
	INSERT INTO [dbo].[Works](WorkName, Description, MaxGrade)
	VALUES
		("work1", "description-1", 100),
		("work2", "description-2", 100),
		("work3", "description-3", 100),
		("work4", "description-4", 10),
		("work5", "description-5", 100);
END

IF(EXISTS(SELECT * FROM [CompletedWorks]))
BEGIN
	PRINT N'Create [dbo].[CompletedWorks]'
	DROP TABLE CompletedWorks
	CREATE TABLE [dbo].[CompletedWorks]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
		[StudentId] INT NOT NULL,
		FOREIGN KEY(StudentId) REFERENCES Students(Id),
		[WorkId] INT NOT NULL, 
		FOREIGN KEY(WorkId) REFERENCES Works(Id),
		[IsChecked] BIT NOT NULL DEFAULT 0
	)
	PRINT N'Insert data into [dbo].[CompletedWorks]'
	INSERT INTO [dbo].[CompletedWorks](StudentId, WorkId, IsChecked)
	VALUES
		( 2, 1, 0),
		( 1, 1, 1),
		( 3, 4, 1),
		( 3, 2, 0),
		( 2, 2, 1);
END