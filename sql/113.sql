
create database spring5fs character set=utf8;

create table spring5fs.MEMBER (
	ID int auto_increment primary key,
	EMAIL varchar(255),
    PASSWORD varchar(100),
    NAME varchar(100),
    REGDATE datetime,
    unique key(EMAIL)
)engine=InnoDB character set=utf8;

use spring5fs;
insert into MEMBER(EMAIL, PASSWORD, NAME, REGDATE) values
	('madvirus@madvires.net', '1234', 'cbk', now());

select * from member;

create database memberdb;

use memberdb;

create table membertable (
	id varchar(50) primary key,
    name varchar(50) not null,
    age int not null
);

select * from membertable;

create table memberemail (
	email varchar(100) primary key
);