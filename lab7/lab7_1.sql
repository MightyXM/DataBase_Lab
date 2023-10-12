-- 1. 创建一个行列子集视图，给出选课成绩合格的学生的编号，所选课程号和该课程成绩
CREATE OR REPLACE VIEW t1(NO,sid,cid,score) AS
	SELECT no,sid,cid,score
	FROM choices
	WHERE score>=60
with check option

-- 2. 创建基于多个基表的视图，这个视图由学生姓名和其所选修的课程名及讲授该课程的教师姓名构成
CREATE OR REPLACE VIEW t2 AS
	SELECT sname,cname,tname
	FROM choices
	LEFT JOIN students
	ON students.sid = choices.sid
	LEFT JOIN courses
	ON courses.cid = choices.cid
	LEFT JOIN teachers
	ON teachers.tid = choices.tid
	
-- 3. 创建带表达式的视图，由学生姓名、所选课程名和所有课程成绩都比原来多5分这几个属性组成
CREATE OR REPLACE VIEW t3(sname,cname,socre) AS
	SELECT sname,cname,score+5 AS score
	FROM choices
	LEFT JOIN students
	ON students.sid = choices.sid
	LEFT JOIN courses
	ON courses.cid = choices.cid
	
-- 4. 创建分组视图，将学生的学号及其平均成绩定义为一个视图
CREATE OR REPLACE VIEW t4(sid,avg_socre) AS
	SELECT sid,avg(any_value(score)) as avg_socre
	FROM choices
	GROUP BY sid
	
-- 5. 创建一个基于视图的视图，基于(1)中建立的视图，定义一个包括学生编号，学生所选课程数目和平均成绩的视图
CREATE OR REPLACE VIEW t5 AS
	SELECT sid,count(cid) AS courses_count ,avg(score) AS avg_socre
	FROM t1
	GROUP BY sid
	
-- 6. 查询所有选修课程Software Engineering的学生姓名
SELECT sname
FROM choices
LEFT JOIN students
ON students.sid = choices.sid
WHERE cid = (
SELECT cid
FROM courses
WHERE cname = "Software Engineering")
	
-- 7.插入元组(600000000,823069829,10010,59)到视图CS中。若是在视图的定义中存在WITH CHECK OPTION子句对插入操作有什么影响?
INSERT INTO t1(no,sid,cid,score) VALUES('600000000','823069829','10010',59) -- 插不进去，因为插入cs视图的同时会更新choices表，而no字段不能为空

-- 8. 将视图CS (包含定义WITH CHECK OPTION)中，所有课程编号为10010的课程的成绩都减去5分。这个操作数据库是否会正确执行，为什么?如果加上5分(原来95分以上的不变)呢？
UPDATE t1 
SET score = score-5

UPDATE t1 
SET score = score+5
WHERE score<=95

-- 9. 在视图CS (包含定义WITH CHECK OPTION)删除编号为804529880学生的记录，会产生什么结果?
DELETE FROM t1 
WHERE sid = '804529880'

-- 10. 取消视图SCT和视图CS
DROP VIEW t1;
DROP VIEW t2;
DROP VIEW t3;
DROP VIEW t4;
DROP VIEW t5;




	



