drop table Rozklad;
drop table Ticket;
drop table Marshrut;
drop table Transport;
drop table TransportType;
drop table Driver;

create table Driver(
    id int primary key,
    name varchar(20),
    surname varchar(20),
    phone varchar(15),
    date_birthday date,
    address varchar(15),
    passport_number varchar(20),
    zmina varchar(20)
);

create table TransportType(
    id int primary key,--ключ
    name varchar(50)
);

create table Transport(
    id int primary key,
    transport_mark varchar(20),
    transport_model varchar(20),
    kilkist_mist int,
    type_transportation varchar(20),
    min_vidstan float,
    max_vidstan float,
    
    transport_type int,
    constraint transport_type foreign key (transport_type) references TransportType(id) on delete cascade,--
    driver int,
    constraint driver foreign key (driver) references Driver(id)
);

create table Marshrut(
    id int primary key,
    tras_num int,
    transport int,
    constraint transport foreign key (transport) references Transport(id) on delete cascade
);

create table Ticket(
    id int primary key,
    punkt varchar(50),
    vidstan float,
	gruz varchar(50),
	marshrut int,
    constraint tmarshrut foreign key (marshrut) references Marshrut(id) on delete cascade--видалення каскадом
);

create table Rozklad(
    id int primary key,
	timestart timestamp,
	timeend timestamp,
	marshrut int,
    constraint rmarshrut foreign key (marshrut) references Marshrut(id) on delete cascade
);
