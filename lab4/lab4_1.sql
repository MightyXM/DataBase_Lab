-- 1. 查询编号800009026的学生所选的全部课程的课程名和成绩
SELECT choices.sid,choices.cid,cc.cname,score
FROM choices
LEFT OUTER JOIN(
SELECT courses.cid,courses.cname
FROM courses) as cc
on choices.cid = cc.cid
WHERE choices.sid =  800009026;

-- 2. 查询所有选了database的学生的编号
SELECT choices.sid,cc.cname
FROM choices
LEFT OUTER JOIN(
SELECT courses.cid,courses.cname
FROM courses) as cc
on cc.cid = choices.cid
WHERE cc.cname = 'database';

-- 3. 求出选择了同一个课程的学生对
SELECT x.sid as s1,y.sid as s2
FROM choices x,choices y
WHERE x.cid = y.cid and x.no < y.no
LIMIT 1000

-- 4. 求出至少被两名学生选修的课程编号
SELECT * 
FROM
(SELECT choices.cid,COUNT(any_value(choices.sid)) as cout_sid
FROM choices
GROUP BY cid)  as cc
WHERE cc.cout_sid>2;

-- 5 查询选修了编号800009026的学生所选的某个课程的学生编号
SELECT y.sid
FROM choices x,choices y
WHERE x.cid = y.cid and x.sid = 800009026

-- 6 查询学生的基本信息及选修课程编号和成绩
SELECT students.*,choices.cid,choices.score
FROM students
LEFT OUTER JOIN choices
on students.sid = choices.sid;

-- 7. 查询学号850955252的学生的姓名和选修的课程名称及成绩
SELECT cc.sname,courses.cname,cc.score
FROM courses
JOIN 
(SELECT students.sname,choices.score,choices.cid
FROM students
RIGHT OUTER JOIN choices
on choices.sid = students.sid
WHERE students.sid = 850955252)as cc
on cc.cid = courses.cid;

-- 8.利用集合运算，查询选修课程C++或课程Java的学生的编号
SELECT sid
FROM choices
WHERE cid = (	SELECT cid
							FROM courses
							WHERE courses.cname = 'C++')
UNION
SELECT sid
FROM choices
WHERE cid = (	SELECT cid
							FROM courses
							WHERE courses.cname = 'Java')

-- 实现集合交运算，查询既选修课程C++又选修课程Java的学生的编号
SELECT DISTINCT sid
FROM (SELECT sid
FROM choices
WHERE cid = (	SELECT cid
							FROM courses
							WHERE courses.cname = 'C++')) t1
INNER JOIN
(SELECT sid
FROM choices
WHERE cid = (	SELECT cid
							FROM courses
							WHERE courses.cname = 'Java')) t2
USING(sid);
																				
-- 实现集合减运算，查询选修课程C++而没有选修课程Java的学生的编号
SELECT DISTINCT sid
FROM (SELECT sid
FROM choices
WHERE cid = (	SELECT cid
							FROM courses
							WHERE courses.cname = 'C++')) t1
LEFT JOIN
(SELECT sid
FROM choices
WHERE cid = (	SELECT cid
							FROM courses
							WHERE courses.cname = 'Java')) t2
USING(sid)
WHERE t2.sid IS NULL;


																						

														
														
														
														