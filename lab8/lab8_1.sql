-- 0. 创建user1，user2，user3
CREATE USER 'USER1'@'%' IDENTIFIED BY '1';
CREATE USER 'USER2'@'%' IDENTIFIED BY '2';
CREATE USER 'USER3'@'%' IDENTIFIED BY '3';

-- 1. 授予所有用户对表COURSES的查询权限
GRANT SELECT ON school.courses TO 'USER1'@'%';
GRANT SELECT ON school.courses TO 'USER2'@'%';
GRANT SELECT ON school.courses TO 'USER3'@'%';

-- 2. 授予USER1对表STUDENTS插入和更新的权限，但不授予删除权限，并且授予USER1传播这两个权限的权利。
GRANT UPDATE,INSERT ON school.students TO 'USER1'@'%' WITH GRANT OPTION;

-- 3. 允许USER2在表CHOICE中插入元组，更新的SCORE列，可以选取除了SID以外的所有列。
GRANT INSERT,UPDATE(score),SELECT(no,tid,cid,score) ON school.choices TO 'USER2'@'%';

-- 4. USER1授予USER2对表STUDENTS插入和更新的权限，并且授予USER2传播插入操作的权利。
-- 在user1登录的条件下执行
-- GRANT UPDATE ON school.students TO 'USER2'@'%';
-- GRANT INSERT ON school.students TO 'USER2'@'%' WITH GRANT OPTION;

-- 5. 收回对USER1对表COURSES查询权限的授权
REVOKE SELECT ON school.courses FROM 'USER1'@'%';

-- 6. 由上面2. 和4. 的授权，再由USER2对USER3授予表STUDENTS插入和更新的权限，并且授予USER3传播插入操作的权利。这时候，如果由USER3对USER1授予表STUDENTS的插入和更新权限是否能得到成功?如果能够成功，那么如果由USER2取消USER3的权限，对USER1会有什么影响?如果再由DBA取消USER1的权限，对USER2有什么影响?
REVOKE ALL ON school.students FROM 'USER1'@'%';




-- SELECT USER()
-- DROP USER 'USER1'@'%';
-- DROP USER 'USER2'@'%';
-- DROP USER 'USER3'@'%';