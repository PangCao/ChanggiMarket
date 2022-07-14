create database spring5fs;

create table member(
	email varchar(50),
    primary key(email)
)default charset=utf8mb4;



insert into member value('test@aaa.aaa');
insert into member value('test2@aaa.aaa');
insert into member value('test3@aaa.aaa');
insert into member value('test4@aaa.aaa');
insert into member value('test5@aaa.aaa');

create table test (
	id nvarchar(200)
);
create table test2 ( 
	test21 nchar(20)
)default character set=utf8mb4;
create table test3 ( 
	test21 nchar(20)
)default character set=utf8mb3;

select * from test3test3;