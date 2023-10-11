-- 创 建 数 据 库 表 CUSTOMERS
CREATE TABLE customers(
CID INT NOT NULL,
CNAME VARCHAR(15), 
CITY VARCHAR(20),
DISCNT INT,
PRIMARY KEY(CID));

-- 创 建 数 据 库 表
CREATE TABLE AGENTS(
aid int not null,
aname VARCHAR(15),
CITY VARCHAR(20),
PERCENT INT,
PRIMARY KEY(aid));

-- 创 建 数 据 库 表
CREATE TABLE products(
pid INT not NULL,
pname VARCHAR(15),
PRIMARY KEY(pid));

-- 创建数据库表 ORDERS
CREATE TABLE orders(
ordna INT not null,
MONTH int,
cid int,
aid int,
pid int,
qty int,
dollars float(5),
PRIMARY KEY(ordna),
FOREIGN KEY(cid) REFERENCES customers(cid),
FOREIGN KEY(aid) REFERENCES agents(aid),
FOREIGN KEY(pid) REFERENCES products(pid));

ALTER TABLE products
add COLUMN (city VARCHAR(15),quantity int,price FLOAT(5));

CREATE INDEX c_index
ON customers(cid);

CREATE INDEX a_index
ON agents(aid);

CREATE INDEX p_index 
ON products(pid);

CREATE INDEX ord_index 
ON orders(ordna);

-- DROP INDEX c_index a_index p_index ord_index on customers agents products orders;
DROP INDEX c_index on customers;
DROP INDEX a_index on agents;
DROP INDEX p_index on products;
DROP INDEX ord_index on orders;

-- 删除表
DROP TABLE orders,customers,AGENTS,products;