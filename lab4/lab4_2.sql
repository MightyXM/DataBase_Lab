-- 查询选修Java的所有学生的编号及姓名
SELECT students.sid,students.sname
FROM students	
WHERE sid = any(	SELECT choices.sid
							FROM choices
							WHERE choices.cid = (	SELECT courses.cid
																		FROM courses
																		WHERE courses.cname = 'Java'))
																		
-- 分别使用等值连接和谓词IN两种方式查询姓名为sssht的学生所选的课程的编号和成绩
SELECT choices.cid,choices.score
FROM choices
WHERE choices.sid = (	SELECT students.sid
											FROM students
											WHERE students.sname = 'sssht');
											
SELECT choices.cid,choices.score
FROM choices
WHERE choices.sid IN (	SELECT students.sid
											FROM students
											WHERE students.sname = 'sssht');
											
-- 查询其他课时比课程C++多的课程的名称
SELECT courses.cname
FROM courses
WHERE courses.`hour` > (SELECT courses.`hour`
												FROM courses
												WHERE courses.cname = 'C++');
												
-- 实现集合交运算，查询既选修课程Database又选修课程UML的学生的编号
SELECT DISTINCT sid
FROM
(SELECT sid
FROM choices
WHERE cid = (	SELECT cid
							FROM courses
							WHERE courses.cname = 'Database')) t1
INNER JOIN
(SELECT sid
FROM choices
WHERE cid = (	SELECT cid
							FROM courses
							WHERE courses.cname = 'UML')) t2
USING(sid);
							
-- 实现集合减运算，查询选修课程Database而没有选修课程UML的学生的编号
SELECT DISTINCT sid
FROM (SELECT sid
FROM choices
WHERE cid = (	SELECT cid
							FROM courses
							WHERE courses.cname = 'Database')) t1
LEFT JOIN
(SELECT sid
FROM choices
WHERE cid = (	SELECT cid
							FROM courses
							WHERE courses.cname = 'UML')) t2
USING(sid)
WHERE t2.sid IS NULL;
