-- 1. 授予所有用户对表STUDENTS的查询权限
GRANT SELECT ON school.students TO 'USER1'@'%';
GRANT SELECT ON school.students TO 'USER2'@'%';
GRANT SELECT ON school.students TO 'USER3'@'%';

-- 2. 授予所有用户对表COURSES的查询和更新权限。
GRANT SELECT,UPDATE ON school.courses TO 'USER1'@'%';
GRANT SELECT,UPDATE ON school.courses TO 'USER2'@'%';
GRANT SELECT,UPDATE ON school.courses TO 'USER3'@'%';

-- 3. 授予USER1对表TEACHERS的查询，更新工资的权限，且允许USER1可以传播这些权限。
GRANT SELECT,UPDATE(salary) ON school.teachers TO 'USER1'@'%' WITH GRANT OPTION;

-- 4. 授予USER2对表CHOICES的查询，更新成绩的权限
GRANT SELECT,UPDATE(score) ON school.choices TO 'USER2'@'%';

-- 5. 授予USER2对表TEACHERS的除了工资之外的所有信息的查询。
GRANT SELECT(tid,tname,email) ON school.teachers TO 'USER2'@'%';

-- 6. 由USER1授予USER2对表TEACHERS的查询权限和传播的此项权限的权利
-- user1的连入下，执行 GRANT SELECT ON school.teachers TO 'USER2'@'%' WITH GRANT OPTION;

-- 7. 由USER2授予USER3对表TEACHERS的查询权限，和传播的此项权限的权利。再由USER3授予USER2上述权限，这样的SQL语句能否成功得到执行？

-- 8. 取消USER1对表STUDENTS的查询权限，考虑由USER2的身份对表STUDENTS进行查询，操作能否成功?为什么?
REVOKE SELECT ON school.students FROM 'USER1'@'%';

-- 9. 消USER1和USER2的关于表COURSES的权限
REVOKE ALL ON school.courses FROM 'USER1'@'%';
REVOKE ALL ON school.courses FROM 'USER2'@'%';







