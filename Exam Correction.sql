-------------------------------------------Exam Correction-------------
Create proc ExamCorrrection @st_id int ,@crs_code int, @dept_id int, @ex_code int
as
begin
	begin try
		if exists (select St_ID,Exam_Code from Resualt where St_ID=@st_id)
			begin
				declare @total int=0
						SELECT @total= SUM (q.Quest_Grade)
						FROM Resualt r , Questions q
						WHERE r.Quest_Num=q.Quest_Num and r.Exam_Code=@ex_code
						and r.St_ID = @st_id and Answer=Correct_Answer
				UPDATE Exam
				SET Grade = @total
				WHERE Exam_Code=@ex_code and  Course_Code=@crs_code and Dept_ID=@dept_id

				select Grade from Exam where Exam_Code=@ex_code
			end
		else
			print 'invalid information'

	end try
	begin catch
		select 'Error Calc'
	end catch

end


exec ExamCorrrection 124,23,5,41
