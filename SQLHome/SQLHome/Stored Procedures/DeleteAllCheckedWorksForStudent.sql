CREATE PROCEDURE [dbo].[DeleteAllCheckedWorksForStudent](@studentId INTEGER, @toDelete INT OUTPUT)
AS SELECT @toDelete = COUNT(*)
	FROM CompletedWorks
	WHERE StudentId = @studentId AND IsChecked = 1
DELETE FROM CompletedWorks
	WHERE StudentId = @studentId AND IsChecked = 1
RETURN 0
