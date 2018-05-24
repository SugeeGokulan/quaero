create procedure load_student_data
as
BEGIN 
	
	update a
	set a.studentpin = b.studentpin, 
	a.firstname = b.firstname, 
	a.middleinitial = b.middleinitial, 
	a.lastname = b.lastname, 
	a.address = b.address, 
	a.city = b.city, 
	a.state = b.city, 
	a.zipcode = b.zipcode, 
	a.email = b.email, 
	a.phone = b.phone, 
	a.birthdate = case when isdate(b.birthdate) = 1 then cast(b.birthdate as date) end, 
	a.gender = b.gender,
	a.update_date = GETDATE(),
	a.file_id = b.file_id
	from student a
	join stage_student b on a.sequence = b.sequence and a.Studentpin=b.Studentpin
	
	insert into student 
	select a.file_id
      ,a.sequence
      ,a.Studentpin
      ,a.firstname
      ,a.middleinitial
      ,a.lastname
      ,a.address
      ,a.city
      ,a.state
      ,a.zipcode
      ,a.email
      ,a.phone
      ,case when isdate(a.birthdate) = 1 then cast(a.birthdate as date) end
      ,a.gender
      ,GETDATE()
      ,GETDATE() 
	from stage_student a
	left join student b on a.sequence = b.sequence and a.Studentpin=b.Studentpin
	where b.sequence is null

	insert into student_enrollment
	select 
	   b.student_id
      ,a.file_id
      ,a.Highschoolname
      ,case when ISNUMERIC(a.graduationyear) = 1 then cast(a.graduationyear as int) end
      ,a.gpa
      ,c1.ctype_id
      ,c2.ctype_id
      ,c3.ctype_id
      ,c4.ctype_id
      ,s1.special_id
      ,s2.special_id
      ,s3.special_id
      ,GETDATE()
      ,GETDATE()
	from stage_student a
	join student b on a.sequence = b.sequence and a.Studentpin=b.Studentpin
	left join college_control_type c1 on a.ctype01 = c1.ctype_code
	left join college_control_type c2 on a.ctype02 = c2.ctype_code 
	left join college_control_type c3 on a.ctype03 = c3.ctype_code
	left join college_control_type c4 on a.ctype04 = c4.ctype_code
	left join specialized_college_preference s1 on s1.special_code = a.special01
	left join specialized_college_preference s2 on s2.special_code = a.special02
	left join specialized_college_preference s3 on s3.special_code = a.special03
	left join student_enrollment s on s.student_id = b.student_id
	where s.student_id is null

	update s set
       s.file_id = a.file_id
      ,s.Highschoolname=a.Highschoolname
      ,s.graduationyear = case when ISNUMERIC(a.graduationyear) = 1 then cast(a.graduationyear as int) end
      ,s.gpa = a.gpa
      ,s.ctype01=c1.ctype_id
      ,s.ctype02=c2.ctype_id
      ,s.ctype03=c3.ctype_id
      ,s.ctype04=c4.ctype_id
      ,s.special01=s1.special_id
      ,s.special02=s2.special_id
      ,s.special03=s3.special_id
      ,s.update_date=GETDATE()
	from student_enrollment s 
	join student b on s.student_id = b.student_id
	join stage_student a on a.sequence = b.sequence and a.Studentpin=b.Studentpin
	left join college_control_type c1 on a.ctype01 = c1.ctype_code
	left join college_control_type c2 on a.ctype02 = c2.ctype_code 
	left join college_control_type c3 on a.ctype03 = c3.ctype_code
	left join college_control_type c4 on a.ctype04 = c4.ctype_code
	left join specialized_college_preference s1 on s1.special_code = a.special01
	left join specialized_college_preference s2 on s2.special_code = a.special02
	left join specialized_college_preference s3 on s3.special_code = a.special03
	

	update [dbo].[File_track_tbl]
	set status='Success'
	,update_date = getdate()
	where file_id in (select file_id from stage_student)
	
END 