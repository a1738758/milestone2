CREATE TABLE User
(fisrt_name VARCHAR2(15),
last_name VARCHAR2(15),
user_num NUMBER(8) PRIMARY KEY,
email VARCHAR2(35));

CREATE TABLE Account
(acc_num NUMBER(8) PRIMARY KEY,
acc VARCHAR2(20),
psw VARCHAR(20));

CREATE TABLE Manager
(fisrt_name VARCHAR2(15),
last_name VARCHAR2(15),
manager_num NUMBER(8) PRIMARY KEY,
email VARCHAR2(35)
CONSTRAINT manager_num_fk FOREIGN KEY(manager_num) REFERENCES User(user_num));

CREATE TABLE Task
(task_num NUMBER(8),
task_name VARCHAR2(15),
ass_user NUMBER(8),
ass_manager NUMBER(8),
task_detail VARCHAR2(50),
CONSTRAINT ass_user_fk FOREIGN KEY(ass_user) REFERENCES User(user_num),
CONSTRAINT ass_manager_fk FOREIGN KEY(ass_manager) REFERENCES Manager(manager_num));


---- inserting into tables
INSERT INTO User VALUES
('Lebron', 'James', '001', "111@11.com");

INSERT INTO User VALUES
('Kobe', 'Bryant', '002', "222@22.com");

INSERT INTO Manager VALUES
('Steve', 'Nash', '003', "333@33.com");

INSERT INTO Account VALUES
('001', 'aaaaa', 'aaaaapsw');

INSERT INTO Account VALUES
('002', 'bbbbb', 'bbbbbpsw');

INSERT INTO Task VALUES
('001', 'Programmer', '001','001','Do some programming work');

SELECT * FROM User;
SELECT * FROM Account;
SELECT * FROM Manager;
SELECT * FROM Task;

--SQL SELECT statement，Find the email of managers who assigned the work No.001
SELECT Manager.email
FROM Manager 
LEFT JOIN Task
ON Manager.manager_num=Task.ass_manager
WHERE Task.task_num='001';


