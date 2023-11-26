-- 创建用户logzhao
CREATE USER 'logzhao'@'%' IDENTIFIED BY 'zhao';

-- 允许查到全校的课程信息以及本班学生的选课信息
GRANT SELECT ON school.courses TO 'logzhao'@'%';

-- 创建2008级学生选课信息的视图 scview,把访问该视图的权限授予赵老师
CREATE OR REPLACE VIEW scview(no,sid,tid,cid,score) AS
	SELECT *
	FROM choices
	WHERE sid IN(
		SELECT sid
		FROM students
		WHERE grade = 2008
	)
with check option;
GRANT SELECT ON school.scview TO 'logzhao'@'%';


-- 创建能查询指定课程选课信息的存储过程 scpro，将执行该存储过程的权限授予赵老师
DELIMITER //

CREATE PROCEDURE scpro (IN sname_param VARCHAR(50))
BEGIN
    SELECT *
    FROM scview
    WHERE cid IN (
        SELECT cid
        FROM courses
        WHERE cname = sname_param
    );
END //

DELIMITER ;

-- CALL scpro('C++');
GRANT EXECUTE ON PROCEDURE school.scpro TO 'logzhao'@'%';

-- 撤销赵老师查询某课程的选课情况，再验证赵老师能否执行存储过程
REVOKE SELECT ON school.courses FROM 'logzhao'@'%';

-- 当这个配置开启，服务器将在账号登录时，自动激活账号被授予所有角色。并且，优先于SET DEFAULT ROLE设置的默认值。如果禁用activate_all_roles_on_login，服务器只会激活默认角色 。
#设置开启
set global activate_all_roles_on_login=ON;
-- 查看是否开启
show variables like 'activate_all_roles_on_login';

-- 创建辅导员角色m_role,然后对角色进行插入操作授权
CREATE ROLE m_role;
GRANT SELECT,INSERT ON school.students TO m_role;
-- 以三个辅导员为例
-- 创建用户
CREATE USER 'counselor1'@'%' IDENTIFIED BY '1';
-- CREATE USER 'counselor2'@'%' IDENTIFIED BY '2';
-- CREATE USER 'counselor3'@'%' IDENTIFIED BY '3';
-- 将用户添加为角色成员
GRANT m_role TO 'counselor1'@'%';
-- GRANT m_role TO 'counselor2'@'%';
-- GRANT m_role TO 'counselor3'@'%';

SHOW GRANTS FOR 'counselor1'@'%';





GRANT USAGE ON *.* TO `counselor1`@`%`

GRANT `m_role`@`%` TO `counselor1`@`%`
