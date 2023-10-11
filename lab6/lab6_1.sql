-- 1.使用SQL语句向STUDENTS表中插入元组(编号：700045678；名字：LiMing；EMAIL：LX@cdemg.com；年级：1992)
INSERT INTO STUDENTS VALUES (700045678,"LiMing","LX@cdemg.com",1992);

-- 2. 对每个课程，求学生的选课人数和学生的平均成绩，并把结果存入数据库。使用SELECT INTO和 INSERT INTO两种方法实现。（提示：可先创建一个新表再插入数据）

CREATE TABLE ans2(
cid INT,
nums INT,
avg_socre DOUBLE
)
-- 不支持
-- SELECT cid,COUNT(sid) as nums,AVG(score) as avg_socre
-- INTO ans2
-- FROM choices
-- GROUP BY cid
DROP TABLE ans2;

CREATE TABLE ans2(
SELECT cid,COUNT(sid) as nums,AVG(score) as avg_socre
FROM choices
GROUP BY cid)

INSERT INTO ans2(
SELECT cid,COUNT(sid) as nums,AVG(score) as avg_socre
FROM choices
GROUP BY cid)

-- 3. 在STUDENTS表中使用SQL语句将姓名为“LiMing”的学生的年级改为“2002”
UPDATE students SET grade = 2002 WHERE sname = "LiMing";


-- 4. 在TEACHERS表中使用SQL语句将所有教师的工资多加500元
UPDATE teachers SET salary = salary + 500;

-- 5. 将姓名为zapyv的学生的课程“C”的成绩加上5分
UPDATE choices SET score = score + 5 WHERE sid = 
(SELECT sid
FROM students
WHERE sname = "zapyv") AND cid = 
(SELECT cid
FROM courses
WHERE cname = "C");

SELECT *
FROM choices
WHERE sid = (SELECT sid
FROM students
WHERE sname = "zapyv")
AND cid = (
SELECT cid
FROM courses
WHERE cname = "C")

-- 6. 在STUDENTS表中使用SQL语句删除姓名为“LiMing”的学生信息
DELETE FROM students WHERE sname = "LiMing";

-- 7. 删除所有选修课程“Java”的选课记录
DELETE FROM choices WHERE cid = (
SELECT cid
FROM courses
WHERE cname = "Java");

SELECT *
FROM choices
WHERE cid = (
SELECT cid
FROM courses
WHERE cname = "Java")

-- 8. 对COURSES表做删去时间<48的元组的操作，并讨论该删除操作所受到的约束
SELECT *
FROM courses
WHERE `hour` <48

-- 执行删除操作失败
-- DELETE FROM courses WHERE `hour`<48 













