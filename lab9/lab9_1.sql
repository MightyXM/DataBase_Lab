-- 1. 查询所有选课记录的成绩并将其换算为五分制(满分为5分，合格为3分),注意SCORE取NULL值的情况。
SELECT score*5/100 as score_5
FROM choices
WHERE score is NOT NULL

-- 2. 查询选修编号为10028的课程的学生的人数，其中成绩合格的学生人数，不合格的学生人数，讨论NULL值的特殊含义。
SELECT cid,COUNT(score) as students_num
FROM choices
WHERE score IS NOT NULL AND cid = 10028
GROUP BY cid

SELECT c1.cid,c1.passed,unpassed
FROM(
	SELECT cid,COUNT(score) AS passed
	FROM choices
	WHERE score IS NOT NULL AND score >=60
	GROUP BY cid) as c1
LEFT JOIN
(SELECT c2.cid,c2.unpassed
FROM(
	SELECT cid,COUNT(score) AS unpassed
	FROM choices
	WHERE score IS NOT NULL AND score <60
	GROUP BY cid) as c2
WHERE cid = 10028) AS cc
ON c1.cid = cc.cid
WHERE c1.cid = 10028

-- 3. 通过实验检验在使用ORDER BY进行排序时，取NULL的项是否出现在结果中?如果有，在什么位置?
SELECT score
FROM choices
ORDER BY score

-- 4. 在上面的查询的过程中如果加上保留字DISTINCT会有什么效果呢?
SELECT DISTINCT score
FROM choices
ORDER BY score

-- 5. 通过实验说明使用分组GROUP BY对取值为NULL的项的处理
SELECT score,COUNT(sid)
FROM choices
GROUP BY score

SELECT *
FROM
	(SELECT cid,COUNT(score)
	FROM choices
	GROUP BY cid) as c1
JOIN
	(SELECT cid,COUNT(*)
	FROM choices
	GROUP BY cid) as c2
ON c1.cid = c2.cid

SELECT cid,MIN(score),MAX(score)
FROM choices
GROUP BY cid

-- 6. 结合分组，使用集合函数求每个同学的平均分，总的选课记录，最高成绩，最低成绩，总成绩。
SELECT AVG(score),COUNT(*),MAX(score),MIN(score),SUM(score)
FROM choices
GROUP BY sid

-- 7. 查询成绩小于0的选课记录，统计总数，平均分，最大值和最小值。
SELECT *
FROM choices
WHERE score < 0

COUNT(score),AVG(score),MAX(score),MIN(score)





