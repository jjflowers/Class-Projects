USE Cap
Go

SELECT FieldNum, Random FROM Field1
SELECT FieldChar, Random FROM Field2
SELECT FieldNum, FieldChar FROM Fields
SELECT FieldNum, FieldChar, Address, Phone, Number FROM Lots

--WHERE clause
SELECT FieldNum, Random FROM Field1 WHERE (FieldNum%10) = 1
SELECT FieldChar, Random FROM Field2 WHERE FieldChar LIKE '_______'

--JOIN clause
SELECT Fields.FieldNum, Field1.Random, Fields.FieldChar, Field2.Random FROM Fields 
	JOIN Field1 ON Fields.FieldNum = Field1.FieldNum
	JOIN Field2 ON Fields.FieldChar = Field2.FieldChar
SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
	JOIN Field1
	ON Lots.FieldNum = Field1.FieldNum
	JOIN Field2
	ON Lots.FieldChar = Field2.FieldChar

--