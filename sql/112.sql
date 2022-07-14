create database mapdb;

use mapdb;

create table maplist (
	id int auto_increment,
    m_name varchar(100) not null,
    m_x double not null,
    m_y double not null,
    primary key(id)
)default charset=utf8mb4;