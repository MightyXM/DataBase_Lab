-- 1. 查询所有课程记录的上课学时(数据库中为每星期学时),以一学期十八个星期计算每个课程的总学时，注意HOUR取NULL值的情况。
SELECT c.cid,a*`hour`*18 AS among_hour
FROM
(	SELECT cid,COUNT(*) as a
	FROM choices
	GROUP BY cid) AS c
JOIN 
(SELECT cid,hour
FROM courses) as cc
ON c.cid = cc.cid

-- 2. 通过查询选修课程C++的学生的人数，其中成绩合格的学生人数，不合格的学生人数，讨论NULL值的特殊含义
SELECT count(score) as unpassed
FROM choices
WHERE cid = (SELECT cid FROM courses WHERE cname = 'C++') AND score < 60;

SELECT count(score) as passed
FROM choices
WHERE cid = (SELECT cid FROM courses WHERE cname = 'C++') AND score >= 60;

SELECT count(score) as among
FROM choices
WHERE cid = (SELECT cid FROM courses WHERE cname = 'C++');

-- 3. 查询选修课程C++的学生的编号和成绩，使用ORDER BY按成绩进行排序时，取NULL的项是否出现在结果中?如果有，在什么位置?
SELECT sid,score
FROM choices
WHERE cid = (SELECT cid FROM courses WHERE cname = 'C++')
ORDER BY score

-- 4. 在上面的查询的过程中，如果加上保留字DISTINCT会有什么效果呢?
SELECT DISTINCT score
FROM choices
WHERE cid = (SELECT cid FROM courses WHERE cname = 'C++')
ORDER BY score

-- 5. 按年级对所有的学生进行分组，能得到多少个组?与现实的情况有什么不同?
SELECT count(grade)
FROM(
SELECT grade,COUNT(sid)
FROM students
GROUP BY grade) as c

-- 6. 结合分组，使用集合函数求每个课程选修的学生的平均分，总的选课记录数，最高成绩，最低成绩，讨论考察取空值的项对集合函数的作用的影响。
SELECT AVG(score),SUM(score),MAX(score),MIN(score)
FROM choices
GROUP BY cid








