CREATE VIEW [dbo].[CompletedWorkView]
	AS SELECT s.FirstName, s.LastName, w.WorkName FROM [CompletedWorks] co, [Students] s, [Works] w where co.StudentId = s.Id AND co.WorkId = w.Id AND co.IsChecked = 0;
