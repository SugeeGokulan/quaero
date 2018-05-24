
--create database Demo;

drop table fail_code_table

create table fail_code_table(
fail_code int primary key identity(101,1),
fail_desc varchar(50)
)

insert into fail_code_table (fail_desc)
values
('File count not matching with Table count')
insert into fail_code_table (fail_desc)
values
('Duplicates records found in stage table')
insert into fail_code_table (fail_desc)
values
('Other failure')

drop table File_track_tbl
create table File_track_tbl(
file_id int primary key identity (1,1),
file_name varchar(250),
file_path varchar(500),
status varchar(50),
file_record_count int,
fail_code int,
create_date datetime,
update_date datetime,
constraint fk_File_track_tbl_fail_code foreign key (fail_code) references fail_code_table (fail_code)
)


drop table college_control_type
create table college_control_type
( 
ctype_id int primary key identity(200,1),
ctype_code varchar(10),
ctype_desc varchar(128)
)

insert into college_control_type (ctype_code,ctype_desc)
values ( 'STATEPUB','State College/University'),
 ('VOCATIONAL',	'Vocational/Technical School'),
 ('COMMJUNR',	'Community/Junior College'),
 ('PRIVATECOL',	 'Private College/University')

drop table specialized_college_preference
create table specialized_college_preference(
special_id int primary key identity(300,1),
special_code varchar(10),
special_desc varchar(128)
)
insert into specialized_college_preference (special_code,special_desc)
values
('ARCHITCOL','Architectural College'),
('ARTDESIGNC','Art/Design College'),
('BIBLECOLLE','Bible College'),
('COLLEGEED','College of Education'),
('COLLEGESCI','College of Science'),
('COLLMATH','College of Mathematics'),
('CULINARYSC','Culinary School'),
('ENGINRCOL','Engineering College'),
('FAMILYSCI','Family and Consumer Sciences'),
('GENERALLIB','General/Liberal Arts College'),
('INSTTECH','Institute of Technology'),
('LAWSCHOOL','Law School'),
('MEDICALSCH','Medical School'),
('MILACADCOL','Military Academy/College'),
('MUSICCOLLE','Music College/Conservatory'),
('NURSINGCOL','Nursing College'),
('OTHERSPCL','Other/Undecided'),
('SCHENVIRO','School of Forestry/Environmental Studies'),
('SCHJOURN','School of Journalism'),
('SCHOOLBUS','School of Business'),
('SCHOOLCOMM','School of Communications'),
('SCHOOLECO','School of Economics'),
('SCHOOLOFPS','School of Psychology/Sociology'),
('THTRARTCOL','Theatre Arts College')

drop table student
create table student(
student_id bigint primary key identity(1000,1),
file_id int,
sequence varchar(300),
Studentpin varchar(300), 
firstname varchar(300), 
middleinitial varchar(300), 
lastname varchar(300), 
address varchar(300), 
city varchar(300), 
state varchar(300), 
zipcode varchar(300), 
email varchar(300), 
phone varchar(300), 
birthdate date, 
gender varchar(30),
create_date datetime,
update_date datetime,
constraint fk_student_file foreign key (file_id) references File_track_tbl (file_id)
)

drop table student_enrollment

create table student_enrollment(
student_id bigint,
file_id int,
Highschoolname varchar(300), 
graduationyear int, 
gpa varchar(30), 
ctype01 int, 
ctype02 int, 
ctype03 int, 
ctype04 int, 
special01 int, 
special02 int, 
special03 int,
create_date datetime,
update_date datetime,
constraint fk_student_enrollment_id foreign key (student_id) references student (student_id),
constraint fk_student_enrollment_file foreign key (file_id) references File_track_tbl (file_id),
constraint fk_student_enrollment_ctype01 foreign key (ctype01) references college_control_type (ctype_id),
constraint fk_student_enrollment_ctype02 foreign key (ctype02) references college_control_type (ctype_id),
constraint fk_student_enrollment_ctype03 foreign key (ctype03) references college_control_type (ctype_id),
constraint fk_student_enrollment_ctype04 foreign key (ctype04) references college_control_type (ctype_id),
constraint fk_student_enrollment_special01 foreign key (special01) references specialized_college_preference (special_id),
constraint fk_student_enrollment_special02 foreign key (special02) references specialized_college_preference (special_id),
constraint fk_student_enrollment_special03 foreign key (special03) references specialized_college_preference (special_id)
);

drop table [stage_student]
CREATE TABLE [stage_student] (
    [file_id] int,
    [datasource] varchar(300),
    [responsetype] varchar(300),
    [responsedate] varchar(300),
    [ordernumber] varchar(300),
    [groupid] varchar(300),
    [sequence] varchar(300),
    [studentpin] varchar(300),
    [firstname] varchar(300),
    [middleinitial] varchar(300),
    [lastname] varchar(300),
    [suffix] varchar(300),
    [address] varchar(300),
    [address2] varchar(300),
    [city] varchar(300),
    [state] varchar(300),
    [zipcode] varchar(300),
    [zip4] varchar(300),
    [carrierroute] varchar(300),
    [deliverypoint] varchar(300),
    [checkdigit] varchar(300),
    [county] varchar(300),
    [email] varchar(300),
    [phone] varchar(300),
    [cellphone] varchar(300),
    [highschoolname] varchar(300),
    [highschooltype] varchar(300),
    [ceeb] varchar(300),
    [mdrpid] varchar(300),
    [birthdate] varchar(300),
    [gender] varchar(300),
    [graduationyear] varchar(300),
    [gpa] varchar(300),
    [ctype01] varchar(300),
    [ctype02] varchar(300),
    [ctype03] varchar(300),
    [ctype04] varchar(300),
    [special01] varchar(300),
    [special02] varchar(300),
    [special03] varchar(300),
    [hsprep01] varchar(300),
    [hsprep02] varchar(300),
    [hsprep03] varchar(300),
    [hsprep04] varchar(300),
    [hsprep05] varchar(300),
    [hsprep06] varchar(300),
    [hsprep07] varchar(300),
    [hsprep08] varchar(300),
    [major01] varchar(300),
    [major02] varchar(300),
    [activity01] varchar(300),
    [activity02] varchar(300),
    [activity03] varchar(300),
    [activity04] varchar(300),
    [activity05] varchar(300),
    [activity06] varchar(300),
    [activity07] varchar(300),
    [activity08] varchar(300),
    [activity09] varchar(300),
    [activity10] varchar(300),
    [activity11] varchar(300),
    [activity12] varchar(300),
    [activity13] varchar(300),
    [activity14] varchar(300),
    [sport01] varchar(300),
    [sport02] varchar(300),
    [sport03] varchar(300),
    [sport04] varchar(300),
    [sport05] varchar(300),
    [sport06] varchar(300),
    [sport07] varchar(300),
    [sport08] varchar(300),
    [sport09] varchar(300),
    [sport10] varchar(300),
    [denom01] varchar(300),
    [denom02] varchar(300),
    [envir] varchar(300),
    [race01] varchar(300),
    [race02] varchar(300),
    [race03] varchar(300),
    [race04] varchar(300),
    [race05] varchar(300),
    [race06] varchar(300),
    [race07] varchar(300),
    [race08] varchar(300),
    [mplans01] varchar(300),
    [mplans02] varchar(300),
    [mplans03] varchar(300),
    [mplans04] varchar(300),
    [mplans05] varchar(300),
    [mplans06] varchar(300),
    [mplans07] varchar(300),
    [mbranch01] varchar(300),
    [mbranch02] varchar(300),
    [mbranch03] varchar(300),
    [mbranch04] varchar(300),
    [mbranch05] varchar(300),
    [householdreligion] varchar(300),
    [hbcinterest] varchar(300),
    [didparentattend] varchar(300),
    [keycode] varchar(300),
    [modelscore] varchar(300),
    [smartincome] varchar(300),
    [cluster] varchar(300),
    [actenglish] varchar(300),
    [actmath] varchar(300),
    [actreading] varchar(300),
    [actscience] varchar(300),
    [actcomposite] varchar(300),
    [satmath] varchar(300),
    [satreading] varchar(300),
    [satwriting] varchar(300),
    [satcomposite] varchar(300),
    [classrank] varchar(300),
    [classsize] varchar(300),
    [parent1firstname] varchar(300),
    [parent1lastname] varchar(300),
    [parent1email] varchar(300),
    [parent2firstname] varchar(300),
    [parent2lastname] varchar(300),
    [parent2email] varchar(300),
    [clickinquiry] varchar(300),
    [clickapply] varchar(300),
    [clickschedulevisit] varchar(300),
    [visitedcampus] varchar(300),
    [isupdated] varchar(300),
    [alumniid] varchar(300),
    [alumnilastname] varchar(300),
    [alumniaddress] varchar(300),
    [alumnizipcode] varchar(300),
    [isnocharge] varchar(300),
    [brcscandate] varchar(300),
    [userdef01] varchar(300),
    [userdef02] varchar(300),
    [userdef03] varchar(300),
    [userdef04] varchar(300),
    [userdef05] varchar(300),
    [userdef06] varchar(300)
)

drop table [stage_student_history]
CREATE TABLE [stage_student_history] (
    [file_id] int,
    [datasource] varchar(300),
    [responsetype] varchar(300),
    [responsedate] varchar(300),
    [ordernumber] varchar(300),
    [groupid] varchar(300),
    [sequence] varchar(300),
    [studentpin] varchar(300),
    [firstname] varchar(300),
    [middleinitial] varchar(300),
    [lastname] varchar(300),
    [suffix] varchar(300),
    [address] varchar(300),
    [address2] varchar(300),
    [city] varchar(300),
    [state] varchar(300),
    [zipcode] varchar(300),
    [zip4] varchar(300),
    [carrierroute] varchar(300),
    [deliverypoint] varchar(300),
    [checkdigit] varchar(300),
    [county] varchar(300),
    [email] varchar(300),
    [phone] varchar(300),
    [cellphone] varchar(300),
    [highschoolname] varchar(300),
    [highschooltype] varchar(300),
    [ceeb] varchar(300),
    [mdrpid] varchar(300),
    [birthdate] varchar(300),
    [gender] varchar(300),
    [graduationyear] varchar(300),
    [gpa] varchar(300),
    [ctype01] varchar(300),
    [ctype02] varchar(300),
    [ctype03] varchar(300),
    [ctype04] varchar(300),
    [special01] varchar(300),
    [special02] varchar(300),
    [special03] varchar(300),
    [hsprep01] varchar(300),
    [hsprep02] varchar(300),
    [hsprep03] varchar(300),
    [hsprep04] varchar(300),
    [hsprep05] varchar(300),
    [hsprep06] varchar(300),
    [hsprep07] varchar(300),
    [hsprep08] varchar(300),
    [major01] varchar(300),
    [major02] varchar(300),
    [activity01] varchar(300),
    [activity02] varchar(300),
    [activity03] varchar(300),
    [activity04] varchar(300),
    [activity05] varchar(300),
    [activity06] varchar(300),
    [activity07] varchar(300),
    [activity08] varchar(300),
    [activity09] varchar(300),
    [activity10] varchar(300),
    [activity11] varchar(300),
    [activity12] varchar(300),
    [activity13] varchar(300),
    [activity14] varchar(300),
    [sport01] varchar(300),
    [sport02] varchar(300),
    [sport03] varchar(300),
    [sport04] varchar(300),
    [sport05] varchar(300),
    [sport06] varchar(300),
    [sport07] varchar(300),
    [sport08] varchar(300),
    [sport09] varchar(300),
    [sport10] varchar(300),
    [denom01] varchar(300),
    [denom02] varchar(300),
    [envir] varchar(300),
    [race01] varchar(300),
    [race02] varchar(300),
    [race03] varchar(300),
    [race04] varchar(300),
    [race05] varchar(300),
    [race06] varchar(300),
    [race07] varchar(300),
    [race08] varchar(300),
    [mplans01] varchar(300),
    [mplans02] varchar(300),
    [mplans03] varchar(300),
    [mplans04] varchar(300),
    [mplans05] varchar(300),
    [mplans06] varchar(300),
    [mplans07] varchar(300),
    [mbranch01] varchar(300),
    [mbranch02] varchar(300),
    [mbranch03] varchar(300),
    [mbranch04] varchar(300),
    [mbranch05] varchar(300),
    [householdreligion] varchar(300),
    [hbcinterest] varchar(300),
    [didparentattend] varchar(300),
    [keycode] varchar(300),
    [modelscore] varchar(300),
    [smartincome] varchar(300),
    [cluster] varchar(300),
    [actenglish] varchar(300),
    [actmath] varchar(300),
    [actreading] varchar(300),
    [actscience] varchar(300),
    [actcomposite] varchar(300),
    [satmath] varchar(300),
    [satreading] varchar(300),
    [satwriting] varchar(300),
    [satcomposite] varchar(300),
    [classrank] varchar(300),
    [classsize] varchar(300),
    [parent1firstname] varchar(300),
    [parent1lastname] varchar(300),
    [parent1email] varchar(300),
    [parent2firstname] varchar(300),
    [parent2lastname] varchar(300),
    [parent2email] varchar(300),
    [clickinquiry] varchar(300),
    [clickapply] varchar(300),
    [clickschedulevisit] varchar(300),
    [visitedcampus] varchar(300),
    [isupdated] varchar(300),
    [alumniid] varchar(300),
    [alumnilastname] varchar(300),
    [alumniaddress] varchar(300),
    [alumnizipcode] varchar(300),
    [isnocharge] varchar(300),
    [brcscandate] varchar(300),
    [userdef01] varchar(300),
    [userdef02] varchar(300),
    [userdef03] varchar(300),
    [userdef04] varchar(300),
    [userdef05] varchar(300),
    [userdef06] varchar(300)
)