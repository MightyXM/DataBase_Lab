-- 1. 在数据库 school中建立表Stu_Union, 进行主键约束，在没有违反实体完整性的前提下插入并更新一条记录。(参考代码如下：)
CREATE TABLE Stu_Union(
	sno CHAR(5) NOT NULL UNIQUE,
	sname CHAR(8),
	ssex CHAR(1),
	sage INT,
	sdept CHAR(20),
	CONSTRAINT PK_Stu_Union PRIMARY KEY(sno)
);

insert Stu_Union values('10000','王敏','1',23,'cs');

UPDATE Stu_Union SET sno='' WHERE sdept='CS';
UPDATE Stu_Union SET sno='95002' WHERE sname='王敏';
                        
select * from Stu_Union;

-- 2. 演示违反实体完整性的插入操作。
DELETE FROM Stu_union WHERE sname = 'xm'
INSERT Stu_Union VALUES(NULL,'xm','1',21,'cs');


-- 3. 演示违反实体完整性的更新操作
-- DELETE FROM Stu_Union WHERE sname = 'xm';
INSERT Stu_Union VALUES('10001','xm','1',21,'cs');
UPDATE Stu_Union SET sno='95002' WHERE sname = 'xm'

-- 4. 为演示参照完整性，建立表 Course,令 cno 为其主键，并在 Stu_Union 中插入数据。 为下面的实验步骤做预先准备。(参考代码如下：)
insert into Stu_Union values('10001','李勇','0',24,'EE');

select * from Stu_Union;

create table Course(
	cno char(4)NOT NULL UNIQUE,
	cname varchar(50)NOT NULL,
	cpoints int,
	constraint PK primary key(cno)
);

insert into Course values('0001','ComputerNetworks',2);
insert into Course values('0002','Databsae',3);

SELECT * FROM course;

-- 5. 建立表 SC, 令 sno 和 cno 分别为参照 stu union 表以及 Course 表的外键，设定为级联删除，并令(sno,cno) 为其主键。在不违反参照完整性的前提下，插入数据。(参考代码如下：)
CREATE TABLE SC(
	Sno CHAR(5),
	FOREIGN KEY(sno) REFERENCES Stu_Union(sno) ON DELETE CASCADE,
	Cno CHAR(4),
	FOREIGN KEY(cno) REFERENCES Course(cno) ON DELETE CASCADE,
	grade INT,
	CONSTRAINT PK_SC PRIMARY KEY(sno,cno)
);

SET FOREIGN_KEY_CHECKS = 0;     # 临时取消外键约束
insert into sc values('95002','0001',2);
insert into sc values('95002','0002',2);
insert into sc values('10001','0001',2);
insert into sc values('10001','0002',2);
SET FOREIGN_KEY_CHECKS = 1;     # 恢复外键约束

Select * From SC;

-- 6. 演示违反参照完整性的插入数据
insert into sc values(NULL ,'0002',2);

-- 7. 在 Stu_Union 中删除数据，演示级联删除。
Select * From SC;
SELECT * FROM Stu_Union;
SELECT * FROM Course;

DELETE FROM Stu_Union WHERE sno = '95002';

-- 8. 在Course 中删除数据，演示级联删除
DELETE FROM course WHERE cno = '0001';