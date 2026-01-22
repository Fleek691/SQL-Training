--CRUD stands for the four basic operations you can do on data:

--Letter	Meaning	SQL command
--C	Create	INSERT
--R	Read	SELECT
--U	Update	UPDATE
--D	Delete	DELETE
--🧠 Simple meaning

--CRUD =
--👉 Add data
--👉 See data
--👉 Change data
--👉 Remove data


USE [lpuDB]



SELECT Id, deptName
FROM     tbl_dept 
UPDATE tbl_dept
SET          deptName = 'ECE'
WHERE  (Id = 4)

go  
CRUDlpuDB 'SELECT'