delete from TransportType where id>0;
--�������� 1
insert into TransportType values (1, '���������');
insert into TransportType values (2, '�������');
insert into TransportType values (3, '���������');-- ���������� ����
insert into TransportType values (4, '����');



--�������� 2
create or replace directory data_load as 'E:\\'; -- ��������� ����� � ����� D
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
); insert into TransportType select * from TransportTypeLoad;--���������� ���� 
drop table TransportTypeLoad;
--�������� 3
update TransportType set name = '��������' where name = '�������';

--�������� 4
delete from TransportType where name = '��������'; --�������� � ������� TransportType ��� � ������ �������   
delete from TransportType where name = '����' or name = '���������'; 