
alter PROCEDURE CRUDlpuDB
	@Action varchar(10),
	@Name varchar(10)=null,
	@Id int=null
AS
BEGIN
	
	IF @Action = 'INSERT'
	BEGIN
		INSERT INTO tbl_dept (deptName, Id)
		VALUES (@Name, @Id);
	END

	else if @Action ='SELECT'
	begin
		SELECT * from tbl_dept
	end
	else if @Action ='UPDATE'
	begin
		update tbl_dept set deptName=@Name where Id=@Id
	end
	else if @Action='DELETE'
	begin
		delete from tbl_dept where Id=@Id
	end
	else
	begin
		print 'INVALID'
	end
END
GO
