-- 1. 向STUDENTS表插入编号是“800022222”且姓名是“WangLan”的元组
INSERT INTO students VALUES (800022222,"WangLan",NULL,NULL)

-- 2. 向TEACHERS表插入元组(“200001000”,“LXL”,“s4zrck@pew.net”,“3024”)
INSERT INTO teachers VALUES(200001000,"LXL","s4zrck@pew.net",3024)

-- 3. 将TEACHERS表中编号为“200010493”的老师工资改为4000
SELECT * FROM teachers WHERE tid = 200010493
UPDATE teachers set salary = 4000 WHERE tid = 200010493;

-- 4. 将TEACHERS表中所有工资小于2500的老师工资改为2500
SELECT * FROM teachers WHERE salary < 2500;
UPDATE teachers SET salary = 2500 WHERE salary < 2500

-- 5. 将由编号为“200016731”的老师讲授的课程全部改成由姓名为“rnupx”的老师讲授
SELECT *
FROM choices
WHERE tid = 200016731

UPDATE choices SET tid = (SELECT tid FROM teachers WHERE tname = "rnupx") WHERE tid = 200016731

-- 6. 更新编号“800071780”的学生年级为“2001”
UPDATE students SET grade = 2001 WHERE sid = '800071780'

-- 7. 删除没有学生选修的课程
SELECT cid
FROM(
SELECT cid,COUNT(sid) as COUNT
FROM choices
GROUP BY cid) as c
WHERE COUNT<=0

DELETE FROM courses WHERE cid in 
(SELECT cid
FROM(
SELECT cid,COUNT(sid) as COUNT
FROM choices
GROUP BY cid) as c
WHERE COUNT<=0)

-- 8. 删除年级高于1998的学生信息
SELECT *
FROM students
WHERE grade > 1998

DELETE FROM choices WHERE sid = ANY(SELECT sid
FROM students
WHERE grade > 1998)
DELETE FROM students WHERE grade>1998

-- 9. 删除没有选修课程的学生信息
SELECT *
FROM students
WHERE sid NOT in (SELECT sid
FROM choices)

DELETE FROM students WHERE sid not in (SELECT sid
FROM choices)

-- 10. 删除成绩不及格的选课记录
SELECT *
FROM choices
WHERE score<60

DELETE FROM choices WHERE score < 60