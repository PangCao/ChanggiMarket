create database changgimarket;

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
    primary key(c_id))default charset=utf8mb4;
    
insert into customer values ('cus1', '1234', '고객1', 'cus1@cus.cus', '000-0000-0000', '고객의 주소를 입력', '선택안함','2022-05-17',true, true, 0);
insert into customer values ('cus2', '1234', '고객1', 'cus1@cus.cus', '000-0000-0000', '고객의 주소를 입력', '선택안함','2022-05-17',true, true, 0);
insert into customer values ('cus3', '1234', '고객1', 'cus1@cus.cus', '000-0000-0000', '고객의 주소를 입력', '선택안함','2022-05-17',true, true, 0);

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

insert into recipe (r_category, r_name, r_desc, r_product, r_unit, r_tip) values ('국·탕·찌개·전골','된장찌개','구수함이 끝내주는 된장찌개','양파(100g),감자(100g),된장(100g)','1,1,1','1.물을 보글보글 끓여주세요.\n2.된장을 풀어주세요.\n3.완성!!!');
insert into recipe (r_category, r_name, r_desc, r_product, r_unit, r_tip) values ('국·탕·찌개·전골','김치찌개','묵은지의 깊은 맛이 느껴지는 김치찌개','양파(100g),감자(100g),김치(500g)','1,1,1','1.물을 보글보글 끓여주세요.\n2.김치와 재료를 넣어주세요.\n3.완성!!!');
insert into recipe (r_category, r_name, r_desc, r_product, r_unit, r_tip) values ('국·탕·찌개·전골','야채국','깔끔하고 건강한 맛','양파(100g),감자(100g),당근(100g)','1,2,1','1.물을 보글보글 끓여주세요.\n2.야채를 넣어주세요.\n3.완성!!!');
insert into recipe (r_category, r_name, r_desc, r_product, r_unit, r_tip) values ('밥·죽','카레라이스','간단하고 맛있는 한끼식사','양파(100g),감자(100g),당근(100g),카레(100g)','1,2,1,1','1.야채를 볶아주세요.\n2.물을 넣고 카레가루를 넣어주세요.\n3.완성!!!');

create table foodlist (
	f_name varchar(30) not null,
    f_price int,
    primary key(f_name)
)default charset=utf8mb4;

insert into foodlist values ('양파(100g)', 1000);
insert into foodlist values ('감자(100g)', 1500);
insert into foodlist values ('당근(100g)', 1800);
insert into foodlist values ('오이(100g)', 900);
insert into foodlist values ('된장(100g)', 2000);
insert into foodlist values ('김치(500g)', 8000);
insert into foodlist values ('카레(100g)', 1200);

use changgimarket;
select * from foodcustomerlist;
