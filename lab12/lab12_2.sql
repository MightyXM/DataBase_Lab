-- 1. 建立一个在worker表上的触发器T4, 要求插入记录的sage值必须比表中已记录的最大 sage值大
DELIMITER $$
CREATE TRIGGER check_change_sage_trigger
BEFORE INSERT ON worker
FOR EACH ROW
BEGIN
    DECLARE maxSage INT;
		
    -- 获取表中已记录的最大 Sage 值
    SELECT MAX(Sage) INTO maxSage FROM worker;

    -- 如果插入记录的 Sage 小于或等于最大 Sage，则抛出异常
    IF NEW.Sage <= maxSage THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sage must be greater than the maximum Sage in the table';
    END IF;
END $$

DELIMITER ;

INSERT INTO worker VALUES ('00003','a','M',10,'科技部');


-- 2. 建立一个在 worker 表上的触发器 T5, 要求当更新一个记录的时候，表中记录的 sage 值要比老记录的 sage值大，因为一般工资级别只能升不能降
DELIMITER $$
CREATE TRIGGER check_update_sage_trigger
BEFORE UPDATE ON worker
FOR EACH ROW
BEGIN
    IF NEW.Sage <= OLD.Sage THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'New Sage must be greater than old Sage in the table';
    END IF;
END $$

DELIMITER ;

UPDATE worker SET Sage = sage-2;