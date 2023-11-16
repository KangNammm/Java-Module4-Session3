create table Class(
ClassID int auto_increment primary key,
ClassName varchar(20),
StartDate date ,
Status bit(1)
);
create table Student(
StudentID int auto_increment primary key,
StudentName varchar(50),
Address varchar(50),
Phone varchar(50),
Status bit,
ClassID int,
foreign key (ClassID) references Class (ClassID));

create table Subject(
SubID int primary key auto_increment,
SubName varchar(50),
Credit int,
Status bit(1) default (1));

create table Mark(
MarkID int primary key auto_increment,
SubID int,
foreign key (SubID) references Subject (SubID),
StudentID int,
foreign key (StudentID) references Student (StudentID),
Mark int,
ExamTimes int);

insert into class values (1,'A1','2008-12-20',1);
insert into class values (2,'A2','2008-12-22',1);
insert into class values (3,'A3',current_date(),1);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);