-- 1. 用 alter table 语句将SC 表中的 on delete cascade 改为 on delete no action,重新插 入SC 的数据。重复课内实验中7.和8.,观察结果，分析原因。
-- SHOW index FROM sc;
SHOW CREATE TABLE sc;


ALTER TABLE SC
DROP FOREIGN KEY sc_ibfk_1,
DROP FOREIGN KEY sc_ibfk_2;
ALTER TABLE SC
ADD CONSTRAINT sno_na FOREIGN KEY (sno) REFERENCES Stu_Union(sno) ON DELETE NO ACTION,
ADD CONSTRAINT cnp_na FOREIGN KEY (cno) REFERENCES Course(cno) ON DELETE NO ACTION;

DELETE FROM Stu_Union WHERE sno = '95002';

-- 2. 使用 alter table 语句将 SC 表中的 on delete cascade 改为 on delete set NULL,重 新插入 SC 的数据。重复课内实验中7.和8.,观察结果，分析原因。
ALTER TABLE SC
DROP FOREIGN KEY sno_na,
DROP FOREIGN KEY cnp_na;

ALTER TABLE SC
DROP PRIMARY KEY;

ALTER TABLE SC
MODIFY COLUMN sno CHAR(5) NULL,
MODIFY COLUMN cno CHAR(4) NULL;

ALTER TABLE SC
ADD CONSTRAINT sno_sn FOREIGN KEY (sno) REFERENCES Stu_Union(sno) ON DELETE set NULL,
ADD CONSTRAINT cno_sn FOREIGN KEY (cno) REFERENCES Course(cno) ON DELETE SET NULL;

DELETE FROM Stu_Union WHERE sno = '95002';
SELECT * FROM sc;

DELETE FROM course WHERE cno = '0001';