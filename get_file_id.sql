
create procedure get_file_id (@file_nm varchar(250), @file_path varchar(500), 
@file_record_count int, @file_id int output) as 

--declare @file_nm varchar(250) = 'test.csv'
--, @file_path varchar(500)
--, @file_record_count int
--, @file_id int

BEGIN

select @file_id = 
case when status='Failed' then file_id 
when status='Processing' then -1
else -2
end 

from File_track_tbl where file_name = @file_nm

print @file_id

if @file_id is null
	BEGIN

		insert into File_track_tbl values(@file_nm, @file_path, 'Processing', @file_record_count,
		null, GETDATE(), GETDATE())

		select @file_id = file_id from File_track_tbl where file_name = @file_nm

	END
else if @file_id > 0
	
	BEGIN

		update File_track_tbl 
		set status = 'Processing',
		fail_code = null,
		update_date = GETDATE()
		where file_id = @file_id

	END


END

--select * from File_track_tbl