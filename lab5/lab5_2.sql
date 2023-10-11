-- 1. 查询选修C++课程的成绩比姓名为znkoo的学生高的所有学生的编号和姓名；
SELECT c.sid,students.sname,c.score
FROM(
	SELECT *
	FROM choices
	WHERE cid = (
		SELECT cid
		FROM courses
		WHERE cname = 'C++')) as c
LEFT JOIN students
ON students.sid = c.sid
WHERE score > (
SELECT score
FROM(
	SELECT *
	FROM choices
	WHERE cid = (
		SELECT cid
		FROM courses
		WHERE cname = 'C++')) as c
LEFT JOIN students
ON students.sid = c.sid
WHERE sname = 'znkoo')

-- 2. 找出和学生883794999或学生850955252的年级一样的学生的姓名
SELECT sname
FROM students
WHERE grade IN (
SELECT grade
FROM students
WHERE sid = 883794999 or sid = 850955252
)

-- 3. 查询没有选修Java的学生名称
SELECT sname
FROM students
WHERE sid NOT IN(
	SELECT sid
	FROM choices
	WHERE cid = (
		SELECT cid
		FROM courses
		WHERE cname = 'Java')
)

-- 4. 找出课时最少的课程的详细信息
SELECT *
FROM courses
WHERE `hour` = (
SELECT MIN(courses.`hour`)
FROM courses)

-- 5. 查询工资最高的教师的编号和开设的课程号
SELECT DISTINCT tid,cid
FROM choices
WHERE tid IN(
SELECT tid
FROM teachers
WHERE salary = 
(SELECT MAX(salary)
FROM teachers))

-- 6. 找出选修课程ERP成绩最高的学生编号
SELECT sid
FROM choices
WHERE score = (
	SELECT MAX(score)
	FROM choices
	WHERE cid = (
		SELECT cid
		FROM courses
		WHERE cname = 'ERP')
) and cid = 
(		SELECT cid
		FROM courses
		WHERE cname = 'ERP')

-- 7. 查询没有学生选修的课程的名称
SELECT cname
FROM courses
WHERE cid NOT in(
SELECT DISTINCT cid 
FROM choices)

-- 8. 找出讲授课程UML的教师讲授的所有课程名称
SELECT c.*,courses.cname
FROM(
	SELECT DISTINCT tid,cid
	FROM choices
	WHERE tid in(
		SELECT tid
		FROM teachers
		WHERE tid IN (
		SELECT DISTINCT tid
		FROM choices
		WHERE cid IN (
		SELECT cid
		FROM courses
		WHERE cname = 'UML'))
)) as c
LEFT JOIN courses
on c.cid = courses.cid

-- 9. 查询选修了编号200102901的教师开设的所有课程的学生编号
SELECT sid 
FROM(
SELECT sid,any_value(COUNT(cid)) as c_count
FROM choices
WHERE tid = 200102901
GROUP BY sid) as c
WHERE c.c_count = (
SELECT any_value(COUNT(cid))
FROM choices
WHERE tid = 200102901
GROUP BY tid)

-- 10. 查询选修课程Database的学生集合与选修课程UML的学生集合的并集
SELECT sid 
FROM choices
WHERE cid = (
SELECT cid
FROM courses
WHERE cname = 'Database')

UNION

SELECT sid 
FROM choices
WHERE cid = (
SELECT cid
FROM courses
WHERE cname = 'UML')




