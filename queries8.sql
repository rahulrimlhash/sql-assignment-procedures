DELIMITER //

CREATE PROCEDURE AddWorker(
    IN p_WorkerID INT,
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_Department VARCHAR(50),
    IN p_Salary DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Worker (WorkerID, FirstName, LastName, Department, Salary)
    VALUES (p_WorkerID, p_FirstName, p_LastName, p_Department, p_Salary);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetWorkerSalary(
    IN p_WorkerID INT,
    OUT p_Salary DECIMAL(10, 2)
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE WorkerID = p_WorkerID;
END //

DELIMITER ;

CALL GetWorkerSalary(123, @Salary);
SELECT @Salary;

DELIMITER //

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_WorkerID INT,
    IN p_Department VARCHAR(50)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE WorkerID = p_WorkerID;
END //

DELIMITER ;

CALL UpdateWorkerDepartment(123, 'Sales');

DELIMITER //

CREATE PROCEDURE GetWorkerCount(
    IN p_Department VARCHAR(50),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;

CALL GetWorkerCount('IT', @WorkerCount);
SELECT @WorkerCount;

DELIMITER //

CREATE PROCEDURE GetAverageSalary(
    IN p_Department VARCHAR(50),
    OUT p_avgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;

CALL GetAverageSalary('Sales', @AverageSalary);
SELECT @AverageSalary;
