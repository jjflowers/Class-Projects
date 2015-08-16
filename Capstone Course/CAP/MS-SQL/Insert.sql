USE Cap
GO

--DELETE FROM Fields;
--DELETE FROM Field1;
--DELETE FROM Field2;
--DELETE FROM Lots;
--GO


DECLARE @counter int;
SET @counter = 1;
WHILE @counter < 5000000
BEGIN
	INSERT INTO Field1 VALUES (@counter,RAND());
	SET @counter = @counter + 1;
END
GO

DECLARE @counter int;
SET @counter = 1;
WHILE @counter < 5000000
BEGIN
	INSERT INTO Field2 VALUES (@counter,RAND());
	SET @counter = @counter + 1;
END
GO

DECLARE @counter1 int;
DECLARE @counter2 int;
SET @counter1 = 1;
SET @counter2 = 1;
WHILE @counter1 < 1000
BEGIN
	WHILE @counter2 < 1000
	BEGIN
		INSERT INTO Fields VALUES (@counter1,@counter2);
		SET @counter2 = @counter2 + 1;
	END
	SET @counter1 = @counter1 + 1;
	SET @counter2 = 1;
END
GO

DECLARE @counter int;
SET @counter = 1;
WHILE @counter < 5000000
BEGIN
	INSERT INTO Lots VALUES (@counter,ABS(Checksum(NewID()) % 5000000),ABS(Checksum(NewID()) % 5000000), CONVERT(varchar(MAX), NEWID()),CONVERT(varchar(MAX), NEWID()), 1234567890);
	SET @counter = @counter + 1;
END
GO

--SELECT * FROM Field1

