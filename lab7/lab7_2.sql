-- 1. 定义选课信息和课程名称的视图VIEWC
CREATE OR REPLACE VIEW viewc AS
	SELECT choices.*, cname
	FROM choices
	LEFT JOIN courses
	ON courses.cid = choices.cid;

-- 2. 定义学生姓名与选课信息的视图VIEWS
CREATE OR REPLACE VIEW views AS
	SELECT choices.*, sname
	FROM choices
	LEFT JOIN students
	ON students.sid = choices.sid;
-- 重写定义
	
-- 3. 定义年级低于1998的学生的视图S1(SID,SNAME,GRADE)
CREATE OR REPLACE VIEW s1(sid,sname,grade) AS
	SELECT sid,sname,grade 
	FROM students
	WHERE grade < 1998

-- 4. 查询学生为“uxjof”的学生的选课信息
SELECT *
FROM choices
WHERE sid  = (
SELECT sid
FROM students
WHERE sname = "uxjof");


-- 5. 查询选修课程“UML”的学生的编号和成绩
SELECT sid,score
FROM choices
WHERE cid = (
SELECT cid
FROM courses
WHERE cname = "UML");

-- 6. 向视图S1插入记录(“60000001,Lily,2001”)
INSERT INTO s1(sid,sname,grade) VALUES("60000001","Lily",2001)

-- 7. 定义包括更新和插入约束的视图S1，尝试向视图插入记录(“60000001,Lily,1997")，删除所有年级为1999的学生记录，讨论更新和插入约束带来的影响
CREATE OR REPLACE VIEW s1(sid,sname,grade) AS
	SELECT sid,sname,grade 
	FROM students
	WHERE grade < 1998
with check option

INSERT INTO s1(sid,sname,grade) VALUES("60000001","Lily",2001) -- 报错，不符合小于1998

DELETE FROM s1
WHERE grade = 1999

-- 8. 在视图VIEWS中将姓名为“uxjof”的学生的选课成绩都加上5分
UPDATE views
SET score = score+5
WHERE sname = "uxjof" -- 更新不了

-- 9. 取消以上建立的所有视图
DROP VIEW viewc;
DROP VIEW views;
DROP VIEW s1;

