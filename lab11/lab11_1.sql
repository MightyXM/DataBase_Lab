-- 1. 创建 Worker 表，并自定义两个约束U1 以及U2, 其中 U1 规定 Name 字段唯一， U2 规定 sage(级别)字段的上限是28。(参考代码如下：)
CREATE TABLE Worker(
	Number char(5),
	Name char(8),
	Sex char(1),
	Sage int CONSTRAINT U2 check(Sage<=28),
	Department char(20),
	CONSTRAINT PK_Worker PRIMARY KEY(Number),
	CONSTRAINT U1 UNIQUE(Name)
);

-- 2. 在Worker 表中插入一条合法记录。(参考代码如下：)
Insert into Worker(Number, Name,Sex, Sage, Department)Values('00001','李勇','M',14,'科技部');
Select * From Worker

-- 3. 演示插入违反U2 约束的例子，U2 规定元组的 sage属性的值必须小于等于28
Insert into Worker(Number, Name,Sex, Sage, Department)Values('00002','xm','M',29,'科技部');

-- 4. 去除 U2 约束。
ALTER TABLE Worker DROP CONSTRAINT U2;
SHOW CREATE TABLE Worker;

-- 5. 重新插入(3)中想要插入的数据，由于去除了U2 约束，所以插入成功。
Insert into Worker(Number, Name,Sex, Sage, Department)Values('00002','xm','M',29,'科技部');
Select * From Worker;

-- 6. 创建规则 rule_sex,规定插入或更新的值只能是 M 或 F,并绑定到 Worker 的 sex字段。
ALTER TABLE Worker ADD CONSTRAINT rule_sex CHECK(sex = 'M' OR sex = 'F');

-- 7. 演示违反规则 rule sex的插入操作。
Insert into Worker(Number, Name,Sex, Sage, Department)Values('00003','xmn','N',29,'科技部');







 