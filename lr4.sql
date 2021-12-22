delete from TransportType where id>0;
--Завдання 1
insert into TransportType values (1, 'Маршрутка');
insert into TransportType values (2, 'Автобус');
insert into TransportType values (3, 'Тролейбус');-- заповнення полів
insert into TransportType values (4, 'Поїзд');



--Завдання 2
create or replace directory data_load as 'E:\\'; -- свторення папки в диску D
create table TransportTypeLoad(
	id int,
    name varchar(50)
) organization external(
    type ORACLE_LOADER
    default directory data_load
    access parameters(
        records delimited by newline
        fields terminated by ','
        missing field values are null
    )
    location ('loading.txt')
); insert into TransportType select * from TransportTypeLoad;--заповнення поля 
drop table TransportTypeLoad;
--Завдання 3
update TransportType set name = 'Мотоцикл' where name = 'Автобус';

--Завдання 4
delete from TransportType where name = 'Мотоцикл'; --видалити з таблиці TransportType все з назвою автобус   
delete from TransportType where name = 'Поїзд' or name = 'Маршрутки'; 