-- 查询全部课程的详细记录；
SELECT *
FROM courses;

-- 查询所有有选修课的学生的编号；
SELECT DISTINCT sid
FROM choices;

-- 查询课时<88(小时)的课程的编号；
SELECT cid,hour
FROM courses
WHERE hour < 88;

-- 请找出总分超过 400 分的学生；
SELECT *
FROM
(SELECT sid,sum(any_value(score)) as score_sum
FROM choices
GROUP BY sid) as cc 
WHERE cc.score_sum > 400;

-- 查询课程的总数；
SELECT SUM(cc.courses_count) as courses_sum
FROM (
SELECT COUNT(courses.cid) as courses_count
FROM courses
) as cc;

-- 查询所有课程和选修该课程的学生总数；
SELECT courses.cid,courses.cname,cc.student_nums
FROM courses
LEFT OUTER JOIN
(SELECT cid,count(any_value(sid)) as student_nums
FROM choices
GROUP BY cid) as cc
on courses.cid = cc.cid;

-- 查询选修成绩合格的课程超过两门的学生编号。
SELECT *
FROM
(SELECT sid,count(any_value(score)) as count
FROM choices
WHERE score >= 60
GROUP BY sid) as cc
WHERE cc.count > 2;

-- 统计各个学生的选修课程数目和平均成绩；
SELECT students.sid,sname,cc.count,cc.avg_score
FROM students
LEFT OUTER JOIN
(SELECT sid,count(any_value(score)) as count,avg(any_value(score)) as avg_score
FROM choices
GROUP BY sid) as cc
on students.sid = cc.sid;