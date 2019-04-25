CREATE TABLE [dbo].[Works]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [WorkName] VARCHAR(MAX) NOT NULL, 
    [Description] TEXT NULL, 
    [MaxGrade] INT NOT NULL
)
