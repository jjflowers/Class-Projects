DELETE FROM Field1;
DELETE FROM Field2;
DELETE FROM Fields;
DELETE FROM Lots;
commit;
select COUNT(*) FROM Fields;

DECLARE 
counter INTEGER := 1;
BEGIN
WHILE counter < 100 LOOP
	INSERT INTO FIELD1 VALUES (counter,dbms_random.value(1,999999999999));
	counter := counter + 1;
END LOOP;
COMMIT;
END;

DECLARE 
counter INTEGER := 1;
BEGIN
WHILE counter < 5000000 LOOP
	INSERT INTO FIELD2 VALUES (counter,dbms_random.value(1,999999999999));
	counter := counter + 1;
END LOOP;
END;

DECLARE 
counter1 INTEGER := 1;
counter2 INTEGER := 1;
BEGIN
WHILE counter1 < 2000 LOOP
	WHILE counter2 < 2000 LOOP
		INSERT INTO Fields VALUES (counter1,counter2);
		counter2 := counter2 + 1;
	END LOOP;
	counter1 := counter1 + 1;
END LOOP;
END;

DECLARE 
counter INTEGER := 1;
BEGIN
WHILE counter < 5000000 LOOP
	INSERT INTO Lots VALUES (counter,TRUNC(dbms_random.value(1,9)),TRUNC(dbms_random.value(1,9)), SYS_GUID(),SYS_GUID(), 1234567890);
	counter := counter + 1;
END LOOP;
END;

commit;

--SELECT * FROM Field1

