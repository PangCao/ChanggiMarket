create database cam;
use cam;
create table camping(
   camping_no int auto_increment primary key,
   camping_name varchar(50) not null,
   camping_address varchar(200) not null,
   camping_thema varchar(10),
   camping_id varchar(12) not null unique, 
   checkin_time time,
   checkout_time time   
    /*
    imgfilename varchar(50),
   foreign key (camping_id) references user (user_id),
    foreign key (camping_name) references company_user (company_name)
    */
)default charset=utf8;
select * from camping;
insert into camping values(1,'가나다 캠핑','창원시 마산합포구 가포해안길 1111','','admin1','','');
insert into camping values(2,'123 캠핑','창원시 마산합포구 가포순환로 4444','','admin2','','');

create table camping_build(
   camping_no int auto_increment primary key,
   camping_name varchar(50) not null,
    pet boolean default false,
    electric boolean default false,
   wifi boolean default false,
   toilet boolean default false,
   shower boolean default false,
   hot_wate boolean default false,
   pool boolean default false,
   market boolean default false,
   walk boolean default false,
   sports boolean default false,   
   playground boolean default false,   
   firewood boolean default false
    /*foreign key(camping_name) references comping(camping_name)*/
)default charset=utf8;

create table room(
   room_no int auto_increment primary key,
   camping_name varchar(50) not null,
   camping_id varchar(12) not null,
   room_name varchar(20) not null,   
   room_price int not null,
   room_min int default 2,
   room_max int default 4,
   room_size int,    
   room_count int not null default 1,
    room_info text
    /*
   imgfilename1 varchar(50),
   imgfilename2 varchar(50),
   imgfilename3 varchar(50)
    /*
   foreign key (camping_id) references user (user_id),
    foreign key (camping_name) references company_user (company_name)
   */
)default charset=utf8;
insert into room values(1,'가나다 캠핑','admin1','독수리방',700000,2,4,0,1,'');
insert into room values(2,'123 캠핑','admin2','까치방',700,6,8,0,1,'');
insert into room values(3,'123 캠핑','admin2','aa방',100,1,2,0,5,'');
insert into room values(4,'123 캠핑','admin2','bb방',10000,2,4,0,10,'');
select * from room;

create table reserve(
   no int auto_increment,
   reserve_id varchar(12) not null,
   reserve_camping_name varchar(50) not null,
   reserve_room_name varchar(20) not null,
   reserve_checkin date not null,
   reserve_checkout date not null,
   use_waiting varchar(10),
   payment_waiting varchar(10),
    primary key(no)
)default charset=utf8;


insert into reserve values(2,'kea9004','가나다 캠핑','독수리방','2022-05-22','2022-05-26','예약취소가능','예약취소가능');
insert into reserve values(3,'kea9004','가나다 캠핑','독수리방','2022-06-01','2022-06-15','예약취소가능','예약취소가능');
insert into reserve values(4,'kea9004','가나다 캠핑','독수리방','2022-07-01','2022-07-20','예약취소가능','예약취소가능');
insert into reserve values(5,'kja9004','123 캠핑','까치방','2022-07-01','2022-07-20','예약취소가능','예약취소가능');
insert into reserve values(6,'kja9004','123 캠핑','aa방','2022-07-01','2022-07-20','예약취소가능','예약취소가능');

insert into reserve values(7,'kja9004','123 캠핑','aa방','2022-05-21','2022-06-22','예약취소가능','예약취소가능');

insert into reserve values(8,'kja9004','123 캠핑','bb방','2022-05-21','2022-05-22','예약취소가능','예약취소가능');
insert into reserve values(1,'kea9004','가나다 캠핑','독수리방','2022-05-21','2022-05-22','예약취소가능','예약취소가능');

select * from reserve;
select count(distinct reserve_room_name) ,reserve_room_name from reserve where not(reserve_checkin='2022-05-21' and reserve_checkout='2022-05-22');
select distinct reserve_camping_name, reserve_room_name, count(*) from reserve where not(reserve_checkin>='2022-05-21' and reserve_checkout<'2022-05-22') group by reserve_camping_name, reserve_room_name;
select distinct reserve_camping_name, reserve_room_name, count(*) from reserve
 where not((reserve_checkin >= '2022-05-21' and reserve_checkin < '2022-05-22') 
 or (reserve_checkout >= '2022-05-21' and reserve_checkout <= '2022-05-22')
 or ('2022-05-21' >= reserve_checkin and '2022-05-21' < reserve_checkout )
 or ('2022-05-22' > reserve_checkin and '2022-05-22' <= reserve_checkout)) group by reserve_camping_name, reserve_room_name;
select camping_name,room_name,room_count from room where room_name = 'aa방' and room_count-1 > 0 and camping_name='123캠핑';

