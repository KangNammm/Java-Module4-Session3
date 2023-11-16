-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’-- 
select *from student where StudentName like'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12--
select*from class where month(StartDate)=12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5-- 
-- cach 1-- 
select*from subject where credit>=3 and credit<=5; 

-- cach 2-- 
select*from subject where credit between 5 and 10;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2--
-- cach 1-- 
select StudentId from Student where StudentName='Hung';
update Student set ClassID=2 where StudentID=1;

-- cach 2-- 
UPDATE Student AS s1
INNER JOIN (
   SELECT StudentID
   FROM Student
   WHERE StudentName = 'Hung'
) AS s2 ON s1.StudentID = s2.StudentID
SET s1.ClassID = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.StudentName,sub.SubName,m.Mark
from mark m 
join student s on m.StudentId=s.StudentId
join subject sub on m.subId=sub.subId
order by Mark desc,SubName asc ;
