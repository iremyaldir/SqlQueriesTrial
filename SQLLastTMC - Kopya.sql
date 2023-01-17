create table tblmentor(
mentorid int primary key identity(1,1),
mentfirstname nvarchar(100) not null,
mentlastname nvarchar(100) not null,
mentmail nvarchar(200) not null,
mentage int,
mentgraduni nvarchar(100) not null,
mentgradyear int not null,
mentgpa float not null,
mentcurrentjob nvarchar(100) not null)

create table tblstudent(
stuid int primary key identity(1,1),
stufirstname nvarchar(100) not null,
stulastname nvarchar(100) not null,
stumail nvarchar(200) not null,
stuphone int)

create table tblsession(
sessionid int primary key identity(1,1),
sessiontime int not null,
stuid int,
mentorid int,
constraint fk1 foreign key (stuid) 
references tblstudent(stuid),
constraint fk2 foreign key (mentorid) 
references tblmentor(mentorid))

create table tblgrade(
gradesum int,
gradenum int,
stuid int,
mentorid int,
constraint fkgrad1 foreign key (stuid) 
references tblstudent(stuid),
constraint fkgrad2 foreign key (mentorid) 
references tblmentor(mentorid))



create table tblpayment(
priceperlesson int,
sessiontime int,
stuid int,
mentorid int,
constraint fkpay1 foreign key (stuid) 
references tblstudent(stuid),
constraint fkpay2 foreign key (mentorid) 
references tblmentor(mentorid))

create table tblappointment(
appoint int primary key identity(1,1),
advavailable int,
stuid int,
mentorid int,
constraint fkappoint1 foreign key (stuid) 
references tblstudent(stuid),
constraint fkappoint2 foreign key (mentorid) 
references tblmentor(mentorid))

create table tblcomment(
commentid int primary key identity(1,1),
comment nvarchar(max),
stuid int,
mentorid int,
constraint fkcomment1 foreign key (stuid) 
references tblstudent(stuid),
constraint fkcomment2 foreign key (mentorid) 
references tblmentor(mentorid))

create table tblsupport(
supportid int primary key identity(1,1),
stuid int,
mentorid int,
constraint fksupport1 foreign key (stuid) 
references tblstudent(stuid),
constraint fksupport2 foreign key (mentorid) 
references tblmentor(mentorid))

create table tblsubscription(
subid int primary key identity(1,1),
submonthly int,
pricemonthly int,
stuid int,
constraint fksub1 foreign key(stuid)
references tblstudent(stuid))

create table tblrate(
stuid int,
mentorid int,
rate char(3),
rating nvarchar(max),
constraint fkrate1 foreign key (stuid) 
references tblstudent(stuid),
constraint fkrate2 foreign key (mentorid) 
references tblmentor(mentorid))

insert into tblmentor values ('Ýrem', 'Yaldýr', 'iremyaldirr@gmail.com', '22', 'Bogazici University', '2025', '3.24', 'Backend Developer', 'Google')
insert into tblmentor values ('Ýlkay', 'Yaldýr', 'ilkayyaldir@gmail.com', '26', 'Istanbul University', '2019', '3.1', 'Lawyer', 'Ýlkay Yaldýr Office')
insert into tblmentor values ('Ýlay', 'Yaldýr', 'ilayyaldir@gmail.com', '28', 'Istanbul University', '2016', '3.12', 'Cyber Security', 'TEB')

insert into tblstudent values('Furkan', 'Bayazit', 'mfb@gmail.com', '323223132')
insert into tblstudent values('Sena', 'Yüzer', 'senayuzer@gmail.com', '323451200')
insert into tblstudent values('Sudenur', 'Yayla', 'sudeyay7@gmail.com', '341234567')

insert into tblgrade( gradesum, gradenum) values('15' , '5')
insert into tblgrade( gradesum, gradenum) values('9' , '3')
insert into tblgrade( gradesum, gradenum) values('12' , '4')



insert into tblpayment(priceperlesson, sessiontime, stuid, mentorid) values ('250', '3', 6, 3)
insert into tblpayment(priceperlesson, sessiontime, stuid, mentorid) values ('250', '1', 5, 2)
insert into tblpayment(priceperlesson, sessiontime, stuid, mentorid ) values ('250', '3', 5,1)
insert into tblpayment(priceperlesson, sessiontime, stuid, mentorid) values ('250', '2', 7, 2)



insert into tblappointment( advavailable) values ('1')
insert into tblappointment(  advavailable) values ('0')
insert into tblappointment( advavailable) values ('1')

insert into tblcomment( comment,stuid, mentorid) values ('She has huge effects on my career', 5,1)
insert into tblcomment(comment,stuid, mentorid) values ('She helped me a lot',6,2)
insert into tblcomment (comment, stuid, mentorid) values ('She is nice; however, we did not have an effective commnucation',5,2)

insert into tblsubscription( submonthly, pricemonthly) values ('1', '200')
insert into tblsubscription( submonthly, pricemonthly) values ('0', '250')

insert into tblrate(stuid, mentorid, rate, rating) values (5,1,5, 'great')
insert into tblrate(stuid, mentorid, rate, rating) values (6,1,5, 'great')
insert into tblrate(stuid, mentorid, rate, rating) values (7,1,4, 'very good')
insert into tblrate(stuid, mentorid, rate, rating) values (6,2,3, 'good')
insert into tblrate(stuid, mentorid, rate, rating) values (7,3,5, 'great')
insert into tblrate(stuid, mentorid, rate, rating) values (5,2,2, 'not good')
insert into tblrate(stuid, mentorid, rate, rating) values (5,3,3, 'good')
insert into tblrate(stuid, mentorid, rate, rating) values (7,2,5, 'great')



alter table tblmentor
add mentcurrentcompany nvarchar(200)

drop table tblgrade


select stufirstname from tblstudent 
where stufirstname like 's%'

select count(rate) from tblrate where mentorid = 1

select stufirstname, stumail  from tblstudent where stuid = 8

select mentfirstname, mentlastname, rate, rating from tblmentor inner join tblrate on (tblrate.mentorid=tblmentor.mentorid)

select top 2 stuid ,avg(cast(rate as float)) as givenrate
from tblRate 
group by stuid order by givenrate desc
select * from tblrate

delete from tblcomment where stuid = 5 and mentorid =2
select * from tblcomment

update tblstudent set stuphone = 386987452 where stuid = 9

GO
create procedure computetotalcostp @stuid int
as
begin
	select priceperlesson*sessiontime from tblpayment where @stuid=stuid
end
GO
exec computetotalcostp 6


PRINT 'Creating StudentComment View'
GO
create view stucomment as
select stufirstname, stulastname, rate from tblstudent inner join tblrate on (tblrate.stuid=tblstudent.stuid)

select* from stucomment

GO
create trigger deletestu
on tblstudent
for delete
as 
begin 
	declare @deletedid int
	set @deletedid =(select stuid from deleted)
	update tblstudent set @deletedid=null 
	where stuid=@deletedid
end

delete from tblstudent where tblstudent.stuid = 1

select* from tblstudent