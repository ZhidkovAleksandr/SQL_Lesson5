USE LearningJoins;



SELECT name, telephone,
(SELECT city FROM personalInfo WHERE personalId = 1) AS City FROM Workers
WHERE id=1
UNION
SELECT name, telephone,
(SELECT city FROM personalInfo WHERE personalId = 2) AS City FROM Workers
WHERE id=2
UNION
SELECT name, telephone,
(SELECT city FROM personalInfo WHERE personalId = 3) AS City FROM Workers
WHERE id=3
UNION
SELECT name, telephone,
(SELECT city FROM personalInfo WHERE personalId = 4) AS City FROM Workers
WHERE id=4;
/*
2 task
*/
SELECT name, telephone,
(SELECT birthDate FROM personalInfo WHERE married =0) AS BDate FROM Workers
WHERE id = (SELECT personalId FROM personalInfo WHERE married =0);

/*
3 task
*/

select * from salary;

select name,
telephone,
(select birthDate FROM personalInfo 
WHERE personalId = (SELECT salaryId from salary WHERE post = 'manager')) AS birthDate
FROM Workers
WHERE id = (SELECT salaryId from salary WHERE post = 'manager');

/*
task6
*/

select * from OrderDetails;

SELECT Customers.FName AS CName, 
Customers.LName AS CLname,
Employees.FName AS EmName,
Employees.LName AS EmLName
FROM Customers, Employees
WHERE Customers.CustomerNo = 
(Select CustomerNo FROM Orders WHERE OrderID = (SELECT OrderID FROM OrderDetails WHERE TotalPrice >500 Group By OrderID))
AND Employees.EmployeeID = (Select EmployeeID FROM Orders WHERE OrderID = (SELECT OrderID FROM OrderDetails WHERE TotalPrice >500 Group By OrderID));

/*
https://www.w3schools.com/sql/sql_exists.asp - operator exists
*/
