--Завдання 1
alter table Rozklad
    drop constraint rmarshrut;--видалення маршрутів
   
alter table Driver--змінна таблиці
--Завдання 2
    drop column zmina;--видаляю поле змінна
alter table Driver
    modify id int not null;--змінюю ід 

--Завдання 3
alter table TransportType
    rename column name to typename;--змінюємо назву поля

--Завдання 4
alter table Ticket
    add tiket1 int;
alter table Ticket
    add tiket2 int;--додавання
alter table Ticket 
    add constraint tiket unique (tiket1, tiket2);--добавлення тікетів унікального
    
--Завдання 5
alter table Transport
    drop constraint driver;
alter table Transport
    add constraint driver foreign key (driver) references Driver(id) on delete cascade;--видалення старого, створення нового зв'язка (тепер він n delete cascade)