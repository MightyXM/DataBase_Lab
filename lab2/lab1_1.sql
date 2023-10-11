-- 创建人员表
CREATE TABLE PERSON(
P INT NOT NULL,
Pname VARCHAR(15),
Page INT NOT NULL,
Pgender VARCHAR(10),
PRIMARY KEY(P),
CONSTRAINT chk_age CHECK(Page>18));

-- 创建房间表
CREATE TABLE ROOM(
R INT NOT NULL,
Rname VARCHAR(15),
Rarea VARCHAR(15),
PRIMARY KEY(R));

-- 创建链接表
CREATE TABLE P_R(
P INT NOT NULL,
R INT NOT NULL,
FOREIGN KEY(P) REFERENCES PERSON(P),
FOREIGN KEY(R) REFERENCES ROOM(R));

-- person表添加属性
ALTER TABLE PERSON 
add Ptype CHAR(10);
-- person表删除约束
Alter Table person   
Drop CHECK chk_age; 
-- room表修改数据类型
ALTER TABLE room
MODIFY COLUMN Rname VARCHAR(30);
-- room表删除属性
ALTER TABLE room
DROP COLUMN rarea;

-- 为ROOM 表创建按 R#降序排列的索引
CREATE INDEX R_index
ON room(R desc);
-- 为 PERSON 表创建按 P#升序排列的索引
CREATE INDEX P_index
ON person(P);
-- 创建表 PERSON 的按 Pname 升序排列的唯一性索引
CREATE UNIQUE INDEX pname_index
ON person(Pname);
-- 取消 PERSON 表 P#升序索引
DROP INDEX p_index on person;
-- 删除表
DROP TABLE p_r;
DROP TABLE person;
DROP TABLE room;