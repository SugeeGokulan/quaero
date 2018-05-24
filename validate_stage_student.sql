create procedure validate_stage_student 
as
BEGIN

	declare @file_record_count int,
	@table_record_count int,
	@file_id int,
	@duplicateCount int,
	@duplicatePin int

	select @file_id = max(file_id) from stage_student

	select @table_record_count = count(*) from stage_student 

	select @file_record_count = file_record_count from File_track_tbl 
	where file_id = @file_id

	select @duplicateCount = count(*)  from (
	select sequence, studentpin from stage_student 
	group by sequence, studentpin having count(*) > 1) duplicateCount

	select @duplicatePin = count(*) from (
	select studentpin from stage_student
	group by studentpin having count(distinct sequence) >1 ) duplicatepin

	if @table_record_count != @file_record_count 
	BEGIN
		
		update File_track_tbl
		set status = 'Failed',
		fail_code = 101,
		update_date = GETDATE()
		where file_id = @file_id

		select -1 as result

	END
	else if @duplicateCount > 0
	BEGIN
		update File_track_tbl
		set status = 'Failed',
		fail_code = 102,
		update_date = GETDATE()
		where file_id = @file_id

		select -2 as result
	END 

	else if @duplicatePin > 0
	BEGIN

		select 1 as result

	END
	else
	BEGIN 
		select 2 as result
	END
	

END
