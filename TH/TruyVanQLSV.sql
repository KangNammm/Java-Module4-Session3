select*from student;

select*from student where status=true;

select*from subject where credit >5;

select s.StudentID, s.StudentName, c.ClassName, m.Mark 
from Student s 
join class c on s.ClassID=c.ClassID
join mark m on s.StudentID=m.StudentID;

select s.StudentID, s.StudentName,c.ClassName 
from Student s 
join Class c on s.ClassID=c.ClassID 
where c.ClassName='A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S 
join Mark M on S.StudentId = M.StudentId 
join Subject Sub on M.SubId = Sub.SubId;

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S 
join Mark M on S.StudentId = M.StudentId 
join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';