-- CUSTOMERS

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (1, 'John Doe', TO_DATE('1985-05-15','YYYY-MM-DD'), 1000, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (2, 'Jane Smith', TO_DATE('1990-07-20','YYYY-MM-DD'), 1500, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (3, 'Robert Wilson', TO_DATE('1950-01-01','YYYY-MM-DD'), 20000, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (4, 'Emily Davis', TO_DATE('1988-08-15','YYYY-MM-DD'), 12000, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (5, 'Michael Brown', TO_DATE('1948-03-10','YYYY-MM-DD'), 5000, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (6, 'Sophia Taylor', TO_DATE('1975-06-25','YYYY-MM-DD'), 25000, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (7, 'Daniel Anderson', TO_DATE('1960-09-14','YYYY-MM-DD'), 8000, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (8, 'Olivia Thomas', TO_DATE('1995-11-11','YYYY-MM-DD'), 18000, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (9, 'James Martin', TO_DATE('1955-04-22','YYYY-MM-DD'), 3000, SYSDATE);

INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES (10, 'Emma Jackson', TO_DATE('1982-12-30','YYYY-MM-DD'), 22000, SYSDATE);


-- ACCOUNTS

INSERT INTO Accounts VALUES (1,1,'Savings',1000,SYSDATE);
INSERT INTO Accounts VALUES (2,2,'Checking',1500,SYSDATE);
INSERT INTO Accounts VALUES (3,3,'Savings',20000,SYSDATE);
INSERT INTO Accounts VALUES (4,4,'Savings',12000,SYSDATE);
INSERT INTO Accounts VALUES (5,5,'Checking',5000,SYSDATE);
INSERT INTO Accounts VALUES (6,6,'Savings',25000,SYSDATE);
INSERT INTO Accounts VALUES (7,7,'Checking',8000,SYSDATE);
INSERT INTO Accounts VALUES (8,8,'Savings',18000,SYSDATE);
INSERT INTO Accounts VALUES (9,9,'Checking',3000,SYSDATE);
INSERT INTO Accounts VALUES (10,10,'Savings',22000,SYSDATE);


-- TRANSACTIONS

INSERT INTO Transactions VALUES (1,1,SYSDATE,200,'Deposit');
INSERT INTO Transactions VALUES (2,2,SYSDATE,300,'Withdrawal');
INSERT INTO Transactions VALUES (3,3,SYSDATE,500,'Deposit');
INSERT INTO Transactions VALUES (4,4,SYSDATE,700,'Deposit');
INSERT INTO Transactions VALUES (5,5,SYSDATE,250,'Withdrawal');
INSERT INTO Transactions VALUES (6,6,SYSDATE,1000,'Deposit');
INSERT INTO Transactions VALUES (7,7,SYSDATE,400,'Withdrawal');
INSERT INTO Transactions VALUES (8,8,SYSDATE,600,'Deposit');
INSERT INTO Transactions VALUES (9,9,SYSDATE,150,'Withdrawal');
INSERT INTO Transactions VALUES (10,10,SYSDATE,900,'Deposit');


-- LOANS

INSERT INTO Loans VALUES
(1,1,5000,5,SYSDATE,ADD_MONTHS(SYSDATE,60));

INSERT INTO Loans VALUES
(2,3,10000,8,SYSDATE,ADD_MONTHS(SYSDATE,60));

INSERT INTO Loans VALUES
(3,5,15000,7,SYSDATE,ADD_MONTHS(SYSDATE,60));

INSERT INTO Loans VALUES
(4,9,20000,9,SYSDATE,ADD_MONTHS(SYSDATE,60));

-- Due within 30 days (for Scenario 3)

INSERT INTO Loans VALUES
(5,4,12000,6,SYSDATE,SYSDATE+10);

INSERT INTO Loans VALUES
(6,6,18000,5,SYSDATE,SYSDATE+20);

INSERT INTO Loans VALUES
(7,8,9000,4,SYSDATE,SYSDATE+25);


-- EMPLOYEES

INSERT INTO Employees
VALUES (1,'Alice Johnson','Manager',70000,'HR',
TO_DATE('2015-06-15','YYYY-MM-DD'));

INSERT INTO Employees
VALUES (2,'Bob Brown','Developer',60000,'IT',
TO_DATE('2017-03-20','YYYY-MM-DD'));

INSERT INTO Employees
VALUES (3,'Chris Green','Analyst',55000,'Finance',
TO_DATE('2019-01-10','YYYY-MM-DD'));

INSERT INTO Employees
VALUES (4,'Sarah White','Lead Developer',80000,'IT',
TO_DATE('2014-08-05','YYYY-MM-DD'));

COMMIT;