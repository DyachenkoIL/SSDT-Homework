CREATE TABLE [dbo].[CompletedWorks]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [StudentId] INT NOT NULL,
	FOREIGN KEY([StudentId]) REFERENCES Students(Id),
    [WorkId] INT NOT NULL, 
	FOREIGN KEY([WorkId]) REFERENCES Works(Id),
    [IsChecked] BIT NOT NULL DEFAULT 0
)
