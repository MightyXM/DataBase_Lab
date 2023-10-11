-- 年级为2001的所有学生名称，按编号升序排列
SELECT sid,sname,grade
FROM students
WHERE grade = 2001
ORDER BY sid;

-- 查询学生的选课成绩合格的课程成绩，并把成绩换算为积点(60 分对应积点为 1,每增加 1 分，积点增加 0.1)。
SELECT sid,score as pre_score,(score-60)*0.1+1 as fina_score
FROM choices
WHERE score > 60;

-- 查询课时是 48 或 64 的课程的名称。
SELECT cname,hour
FROM courses
WHERE hour = 48 OR hour = 64;

-- 查询所有课程名称中含有 data 的课程编号。
SELECT cid,cname
FROM courses
WHERE cname LIKE '%data%';

-- 查询所有选课记录的课程号(不重复显示)。
SELECT distinct  no 
FROM choices;

-- 统计所有老师的平均工资。
SELECT AVG(salary) as avg_salary
FROM teachers;

-- 查询所有学生的编号，姓名和平均成绩，按总平均成绩降序排列

SELECT students.*,cc.avg_score
FROM students
LEFT OUTER JOIN(
SELECT sid,avg(any_value(score)) as avg_score
FROM choices
GROUP BY sid
) as cc
on students.sid = cc.sid
ORDER BY cc.avg_score DESC;

-- 统计各个课程的选课人数和平均成绩

SELECT courses.cid,cname,cc.nums,cc.avg_score
FROM courses
LEFT OUTER JOIN(
SELECT cid,any_value(COUNT(cid)) as nums,avg(any_value(score)) as avg_score
FROM choices
GROUP BY cid) as cc
on courses.cid = cc.cid;

-- 查询至少选修了三门课程的学生编号。

SELECT * 
FROM
(SELECT sid,any_value(COUNT(cid)) as cid_nums
FROM choices
GROUP BY sid) as cc
WHERE cc.cid_nums >= 3;


