-- 1. 为worker表（参照实验十一）建立触发器T1, 当插入或是更新表中数据时，保证所操作的记录的 sage 值大于0。
-- mysql不支持同时建立两个
DELIMITER $$

CREATE TRIGGER check_sage_trigger_insert
BEFORE INSERT ON Worker
FOR EACH ROW
BEGIN
    DECLARE msg VARCHAR(255);

    IF NEW.Sage <= 0 THEN
        SET msg = 'Sage must be greater than 0';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_sage_trigger_update
BEFORE UPDATE ON Worker
FOR EACH ROW
BEGIN
    DECLARE msg VARCHAR(255);

    IF NEW.Sage <= 0 THEN
        SET msg = 'Sage must be greater than 0';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END $$

DELIMITER ;

-- 2. 为 worker 表建立触发器T2, 禁止删除编号为00001的CEO
DELIMITER $$
CREATE TRIGGER forbid_delete_ceo_trigger
BEFORE DELETE ON Worker
FOR EACH ROW
BEGIN
    DECLARE msg VARCHAR(255);

    IF OLD.Number = '00001' THEN
        SET msg = 'CEO cannot be deleted';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END $$

DELIMITER ;

-- 3. worker 表中的人员的编号是不可改变的，创建触发器 T3 实现更新中编号的不可改变性。
DELIMITER $$
CREATE TRIGGER forbid_change_number_trigger
BEFORE UPDATE ON Worker
FOR EACH ROW
BEGIN
    DECLARE msg VARCHAR(255);

    IF NEW.Number != OLD.Number THEN
        SET msg = 'Number cannot be changed';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END $$

DELIMITER ;

-- 4. 演示违反 T1 触发器的约束的插入操作。
INSERT INTO worker VALUES ('00003','a','M',-1,'科技部');

-- 5. 演示违反 T1 触发器的约束的更新操作。
UPDATE worker set Sage = Sage-15;

-- 6. 演示违反 T2 触发器的约束的删除操作。
DELETE FROM worker WHERE Number = '00001';

-- 7. 演示违反 T3 触发器的约束的更新操作。
UPDATE worker set Number = '00006';

-- 8. 演示 INSTEAD OF触发器在不可更新视图上的运用。
-- mysql没有instead of触发器
-- CREATE VIEW view1 AS
-- SELECT * FROM worker;
-- 
-- DELIMITER $$
-- 
-- CREATE TRIGGER view1_insert_trigger
-- INSTEAD OF INSERT ON view1
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO worker(Number, Name,Sex,Sage,Department) VALUES (NEW.Number, NEW.Name,NEW.Sex,NEW.Sage,NEW.Department);
-- END $$
-- 
-- DELIMITER ;
