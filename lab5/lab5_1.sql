-- 1. 查询学号850955252的学生同年级的所有学生资料；
SELECT * 
FROM students
WHERE grade IN (
SELECT grade
FROM students
WHERE sid = 850955252);

-- 2. 查询所有的有选课的学生的详细信息
SELECT *
FROM students
WHERE sid in (
SELECT DISTINCT sid 
FROM choices)

-- 3. 查询没有学生选的课程的编号；
SELECT cid
FROM courses
WHERE cid NOT in(
SELECT DISTINCT cid 
FROM choices)

-- 4.查询选修了课程名为C++的学生学号和姓名
SELECT students.sid,students.sname
FROM students
WHERE sid IN (
	SELECT sid
	FROM choices
	WHERE cid IN (
		SELECT cid
		FROM courses
		WHERE courses.cname = 'C++'))
		
		
-- 5. 找出选修课程成绩最差的选课记录
SELECT cid,SUM(any_value(score))as score
FROM choices
GROUP BY cid
ORDER BY score;

-- 6.找出和课程UML或课程C++的课时一样的课程名称
SELECT courses.cname
FROM courses
WHERE courses.`hour` in (
SELECT courses.`hour`
FROM courses
WHERE courses.cname = 'C++' or courses.cname = 'UML')
and courses.cname != 'C++' AND courses.cname != 'UML'

-- 7.查询所有选修编号10001的课程的学生的姓名
SELECT students.sname
FROM students
WHERE sid in (
SELECT sid
FROM choices
WHERE cid = 10001)

-- 8.查询选修了所有课程的学生姓名
SELECT students.sname
FROM students
WHERE sid IN(
	SELECT sid
	FROM(
		SELECT sid,COUNT(any_value(cid)) as num
		FROM choices
		GROUP BY sid) as cc
	WHERE cc.num in (
		SELECT COUNT(courses.cid)
		FROM courses)
)





