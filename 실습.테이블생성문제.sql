use testdb;

create table student(
studno int primary key,
stuname varchar(10)
);

create table subject(
subno int primary key,
subname varchar(20) not null,
term varchar(1),
type varchar(4),
CONSTRAINT CHECK (term IN ('1', '2')),
CONSTRAINT CHECK (type IN ('필수', '선택'))
);

create table sugang(
studno int,
subno int,
regdate DATE,
resut int,
PRIMARY KEY (studno, subno),
FOREIGN KEY (studno) REFERENCES student(studno),
FOREIGN KEY (subno) REFERENCES subject(subno)
);