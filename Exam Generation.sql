----------------------------------------------Exam Generation------------------------- 
create proc GenerateExam @st_id int ,@crs_code int,@dept_id int 
as
begin  --check that enter valid information
	if exists(select s.St_ID ,sc.Course_Code ,s.Dept_ID from Student s,st_Course sc
				where s.St_ID=sc.St_ID and s.St_ID=@st_id 
				and Course_Code=@crs_code and Dept_ID=@dept_id)
		begin
			declare @ex_code int=(select max(Exam_Code)+1 from Exam) --auto increment to Exam code
			begin try
				insert into Exam (Exam_Code,Course_Code,Dept_ID)
				values (@ex_code,@crs_code,@dept_id)
			end try
			begin catch
				select 'Error Exam'
			end catch

			begin try
				insert into Resualt (Quest_Num, St_ID , Exam_Code)
				SELECT TOP(5) Quest_Num ,@st_id ,@ex_code
				FROM Questions
				WHERE Course_Code=@crs_code and Quest_Type='MCQ'
				ORDER BY NEWID()

				insert into Resualt (Quest_Num, St_ID , Exam_Code)
				SELECT TOP(5) Quest_Num ,@st_id ,@ex_code
				FROM Questions
				WHERE Course_Code=@crs_code and Quest_Type='T/F'
				ORDER BY NEWID()
			end try
			begin catch
				select 'Error selecting questions'
			end catch	
		end 

	ELSE
		PRINT 'Please Enter Valid information'	
END 


GenerateExam 124,23,5





