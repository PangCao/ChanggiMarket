create database changgimarket;
drop database changgimarket;
use changgimarket;
drop table customer;

create table customer 
   (c_id varchar(20) not null,
    c_password varchar(20) not null,
    c_name varchar(10) not null,
    c_mail varchar(40) not null,
    c_phone varchar(15) not null,
    c_addr varchar(100) not null,
    c_gender varchar(4),
    c_birth date,
    c_s_Marketting boolean default false,
    c_e_marketting boolean default false,
    c_point int default 0,
    c_class varchar(10) default 'Bronze', 
    primary key(c_id))default charset=utf8mb4;
    
insert into customer values ('cus1', '1234', '고객1', 'cus1@cus.cus', '000-0000-0000', '고객의 주소를 입력', '선택안함','2022-05-17',true, true, 0, 'GOLD');
insert into customer values ('cus2', '1234', '고객1', 'cus1@cus.cus', '000-0000-0000', '고객의 주소를 입력', '선택안함','2022-05-17',true, true, 0, 'SILVER');
insert into customer values ('cus3', '1234', '고객1', 'cus1@cus.cus', '000-0000-0000', '고객의 주소를 입력', '선택안함','2022-05-17',true, true, 0, 'BRONZE');

select * from customer;

create table seller (
	s_id varchar(20) not null,
    s_password varchar(20) not null,
    s_com_name varchar(10) not null,
    s_com_number varchar(30) not null,
    s_owner_name varchar(10) not null,
    s_mail varchar(40) not null,
    s_phone varchar(15) not null,
    s_addr varchar(100) not null,
    s_s_Marketting boolean default false,
    s_e_marketting boolean default false,
    primary key(s_id))default charset=utf8mb4;

insert into seller values ('admin1','1234','상점','512-2151-12425','상점주인1','seller@seller.se','000-0000-0000','상점의 주소를 입력', true, true);
insert into seller values ('admin2','1234','상점','512-2151-12425','상점주인1','seller@seller.se','000-0000-0000','상점의 주소를 입력', true, true);

select * from seller;

drop table recipe;

create table recipe(
	r_id int not null auto_increment,
    r_category varchar(20) not null,
    r_name varchar(20) not null unique,
    r_desc varchar(100),
    r_product varchar(500) not null,
    r_unit varchar(200),
    r_tip varchar(1000),
    r_img varchar(100),
    primary key(r_id)
)default charset=utf8mb4;
select * from recipe;

insert into recipe (r_category, r_name, r_desc, r_product, r_unit, r_tip, r_img) values ('국·탕·찌개·전골','된장찌개','구수함이 끝내주는 된장찌개','양파(100g),감자(100g),된장(100g)','1,1,1','1.물을 보글보글 끓여주세요.<br>2.된장을 풀어주세요.<br>3.완성!!!', 'djj.jpg');
insert into recipe (r_category, r_name, r_desc, r_product, r_unit, r_tip, r_img) values ('국·탕·찌개·전골','김치찌개','묵은지의 깊은 맛이 느껴지는 김치찌개','양파(100g),감자(100g),김치(500g)','1,1,1','1.물을 보글보글 끓여주세요.<br>2.김치와 재료를 넣어주세요.<br>3.완성!!!', 'kjj.jpg');
insert into recipe (r_category, r_name, r_desc, r_product, r_unit, r_tip, r_img) values ('국·탕·찌개·전골','북어야채국','깔끔하고 건강한 맛','북어(100g),양파(100g),감자(100g),당근(100g)','1,1,2,1','1.물을 보글보글 끓여주세요.<br>2.야채를 넣어주세요.<br>3.완성!!!', 'bs.jpg');
insert into recipe (r_category, r_name, r_desc, r_product, r_unit, r_tip, r_img) values ('밥·죽','카레라이스','간단하고 맛있는 한끼식사','양파(100g),감자(100g),당근(100g),카레(100g)','1,2,1,1','1.야채를 볶아주세요.<br>2.물을 넣고 카레가루를 넣어주세요.<br>3.완성!!!', 'crice.jpg');


drop table foodlist;

create table foodlist (
	f_id int auto_increment,
    f_category varchar(10) not null,
    f_name varchar(50) not null unique,
    f_price int,
    f_unit int,
    primary key(f_id)
)default charset=utf8mb4;
-- main 01(농산) 02(축산) 03(수산) 04(가공)

insert into foodlist (f_category, f_name, f_price, f_unit) values ('010201','양파(100g)', 1000, 200);
insert into foodlist (f_category, f_name, f_price, f_unit) values ('010202','감자(100g)', 1500, 400);
insert into foodlist (f_category, f_name, f_price, f_unit) values ('010203','당근(100g)', 1800, 100) ;
insert into foodlist (f_category, f_name, f_price, f_unit) values ('010204','오이(100g)', 900, 700);
insert into foodlist (f_category, f_name, f_price, f_unit) values ('040201','된장(100g)', 2000, 800);
insert into foodlist (f_category, f_name, f_price, f_unit) values ('040101','김치(500g)', 8000, 1000);
insert into foodlist (f_category, f_name, f_price, f_unit) values ('040202','카레(100g)', 1200, 800);
insert into foodlist (f_category, f_name, f_price, f_unit) values ('030101','북어(100g)', 4000, 500);

select * from foodlist;


use changgimarket;
select * from foodcustomerlist;
select * from customer;


create table cusorder (
	o_num int auto_increment,
    o_date date,
	o_id varchar(20) not null,
    o_f_name varchar(30),
    o_f_img varchar(100),
    o_f_singname varchar(500),
    o_f_singprice varchar(500),
    o_f_singunit varchar(200),
    o_addr varchar(100),
    primary key(o_num),
	foreign key(o_id) references customer(c_id) on delete cascade
)default charset=utf8mb4;

select * from cusorder;

drop table notice;

create table notice (
	n_id int auto_increment,
    n_title varchar(50) not null,
    n_writer varchar(20) not null,
    n_content varchar(2000) not null,
    n_img varchar(400),
    n_date date,
    n_hit int default 0,
    primary key(n_id)
)default charset=utf8mb4;

drop table bulletin;

create table bulletin (
	b_id int auto_increment,
    b_title varchar(50) not null,
    b_writer varchar(20) not null,
    b_content varchar(2000) not null,
    b_img varchar(400),
    b_date date,
    b_hit int default 0,
    primary key(b_id)
)default charset=utf8mb4;

alter table bulletin change b_num b_id int;
select * from bulletin;

create table one_qna (
	oq_id int auto_increment,
    oq_title varchar(50) not null,
    oq_writer varchar(20) not null,
    oq_content varchar(200) not null,
    oq_category varchar(30),
    oq_date date,
    oq_hit int default 0,
    oq_stat varchar(30) default '문의 등록',
    primary key(oq_id)
)default charset=utf8mb4;
drop table one_qna;

select * from one_qna;

create table faq (
	f_id int auto_increment,
    f_title varchar(50) not null,
    f_content varchar(200) not null,
    primary key(f_id)
)default charset=utf8mb4;

insert into faq (f_title, f_content) values ('자주하는 질문 1', '그에 대한 답변1');
insert into faq (f_title, f_content) values ('자주하는 질문 2', '그에 대한 답변2');
insert into faq (f_title, f_content) values ('자주하는 질문 3', '그에 대한 답변3');
insert into faq (f_title, f_content) values ('자주하는 질문 4', '그에 대한 답변4');
insert into faq (f_title, f_content) values ('자주하는 질문 5', '그에 대한 답변5');

drop table r_review;
create table r_review (
	r_id int auto_increment,
    r_title varchar(50) not null,
    r_writer varchar(20) not null,
    r_content varchar(200) not null,
    r_date date,
    r_img varchar(400),
    r_hit int default 0,
    r_like int default 0,
    primary key(r_id)
)default charset=utf8mb4;
select * from r_review;

create table likelist (
	l_num int auto_increment,
    c_id varchar(20) not null,
    r_id int not null,
    primary key(l_num),
    foreign key(c_id) references customer(c_id) on delete cascade,
    foreign key(r_id) references r_review(r_id) on delete cascade
)default charset=utf8mb4;


create table b_comment (
	bc_num int auto_increment,
    bc_name varchar(10),
    bc_id int,
    bc_writer varchar(20),
    bc_content varchar(1000),
    bc_date date,
    primary key(bc_num)
)default charset=utf8mb4;

drop table b_comment;