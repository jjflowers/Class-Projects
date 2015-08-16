--USE Cap

DELETE FROM Fields;
DELETE FROM Field1;
DELETE FROM Field2;
DELETE FROM Lots;


DECLARE 
counter INTEGER := 1;
counter1 INTEGER := 1;
counter2 INTEGER := 1;
BEGIN

WHILE counter < 5000000 LOOP
	INSERT INTO Field1 VALUES (counter,dbms_random.value(1,999999999999));
	counter := counter + 1;
END LOOP;


counter := 1;
WHILE counter < 5000000 LOOP
	INSERT INTO Field2 VALUES (counter,dbms_random.value(1,999999999999));
	counter := counter + 1;
END LOOP;


counter1 := 1;
counter2 := 1;
WHILE counter1 < 100000 LOOP
	WHILE counter2 < 100000 LOOP
		INSERT INTO Fields VALUES (counter1,counter2);
		counter2 := counter2 + 1;
	END LOOP;
	counter1 := counter1 + 1;
END LOOP;


counter := 1;
WHILE counter < 1000000 LOOP
	INSERT INTO Lots VALUES (counter,dbms_random.value(1,999999999999),dbms_random.value(1,999999999999), SYS_GUID(),SYS_GUID(), 1234567890);
	counter := counter + 1;
END LOOP;
END;


--SELECT * FROM Field1

