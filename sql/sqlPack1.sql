create database a;

use a;

create table customer(
	c_id varchar(20) not null,
    c_pw int not null,
    c_name varchar(10) not null,
    c_mail varchar(50) not null,
    c_phone varchar(20) not null,
    c_addr varchar(100) not null,
    c_gender varchar(4),
    c_birth date,
    primary key(c_id))default charset=utf8;

create table seller(
	s_id varchar(20) not null,
    s_pw int not null,
    s_name varchar(10) not null,
    s_mail varchar(50) not null,
    s_phone varchar(20) not null,
    s_addr varchar(100) not null,
    primary key(s_id))default charset=utf8;