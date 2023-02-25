----------------------------------Exam Answers--------------------------------------
create proc Exam_Answers @st_id int ,@quest_num int, @ex_code int , @st_ans varchar(30)
as
begin
	--check that this student already examined
	if exists (select St_ID,Quest_Num,Exam_Code from Resualt where St_ID=@st_id and Exam_Code=@ex_code)
		begin 
			if @st_ans in (select Choices from Choices where Quest_Num=@quest_num)
				begin 
					begin try
					update Resualt
					set Answer= @st_ans
					where St_ID=@st_id and Exam_Code=@ex_code and Quest_Num=@quest_num
					end try

					begin catch
						select 'invalid insert answer'
					end catch
				end
			else
				print('invalid answer')
			end			
	else
		print('this student did not examin')
end


Exam_Answers 124,21,46,'c) Metadata'
Exam_Answers 124,22,46,'a) (n–1)'
Exam_Answers 124,23,46,'c) Fact constellation'
Exam_Answers 124,24,46,'b) Slice'
Exam_Answers 124,25,46,'b) MOLAP'
Exam_Answers 124,26,46,'b) Multidimensional Analysis Software'
Exam_Answers 124,30,41,'c)Metadata'
Exam_Answers 124,31,41,'c)Maximal frequent set'
Exam_Answers 124,32,46,'a)Regression'
Exam_Answers 124,33,46,'b) Two'
Exam_Answers 124,36,46,'a) True'
Exam_Answers 124,37,41,'a)True'
Exam_Answers 124,38,46,'b) False'
Exam_Answers 124,39,41,'b)False'
Exam_Answers 124,40,41,'b)False'

