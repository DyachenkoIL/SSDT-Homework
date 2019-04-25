CREATE PROCEDURE [dbo].[SelectAllStudentWorks](@studentId INT)
AS SELECT co.Id, w.WorkName, co.IsChecked
	FROM Students AS s 
		INNER JOIN CompletedWorks AS co ON s.Id = co.StudentId
		INNER JOIN Works AS w ON w.Id = co.WorkId
	WHERE s.Id = @studentId
RETURN 0
