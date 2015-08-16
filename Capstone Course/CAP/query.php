<?php
	function microtime_float()
	{
		list($usec, $sec) = explode(" ", microtime());
		return ((float)$usec + (float)$sec);
	}
	function MySQL($query)
	{
		$start = microtime_float();
		// Connect to MySQL
		$host="mysql.cfv2m251hguu.us-east-1.rds.amazonaws.com";
		$port=3306;
		$user="admin";
		$password="password";
		$dbname="Cap";
		$socket = "\tmp\mysql.sock";

		$conn = new mysqli($host, $user, $password, $dbname, $port, $socket);
		
		if ($conn->connect_errno) 
		{
			return "Failed to connect to MySQL: (" . $con->connect_errno . ") " . $con->connect_error;
		}
		
		$result = $conn->query($query);
		$conn->close(); 
		
		$end = microtime_float();
		$time = $end - $start;
		return number_format($time, 3);
	}
	function MySQLQuery()
	{			
		$string = (string)MySQL("SELECT FieldNum, Random FROM Field1");//None option clause		
		$string .= " ";
		$string .= (string)MySQL("SELECT FieldChar, Random FROM Field2");//None option clause
		$string .= " ";
		$string .= (string)MySQL("SELECT FieldNum, FieldChar FROM Fields");//None option clause
		$string .= " ";
		$string .= (string)MySQL("SELECT FieldNum, FieldChar, Address, Phone, Number FROM Lots");//None option clause
		$string .= " ";
		$string .= (string)MySQL("SELECT FieldNum, Random FROM Field1 WHERE (FieldNum%10) = 1");//WHERE clause
		$string .= " ";
		$string .= (string)MySQL("SELECT FieldChar, Random FROM Field2 WHERE FieldChar LIKE '_______'");//WHERE clause
	/*	$string .= " ";
		$string .= (string)MySQL("SELECT Fields.FieldNum, Field1.Random, Fields.FieldChar, Field2.Random FROM Fields 
						JOIN Field1 ON Fields.FieldNum = Field1.FieldNum
						JOIN Field2 ON Fields.FieldChar = Field2.FieldChar LIMIT 10"); //JOIN clause
		$string .= " ";
		$string .= (string)MySQL("SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
						JOIN Field1	ON Lots.FieldNum = Field1.FieldNum
						JOIN Field2	ON Lots.FieldChar = Field2.FieldChar LIMIT 10"); //WHERE clause
	*/
		echo $string;
		exit;
	}
	function MSSQL($query)
	{
		$start = microtime_float();
		
		//Connect to MSSQL
		$serverName = "sqlserver.cfv2m251hguu.us-east-1.rds.amazonaws.com,1433";
		$connectionInfo = array( "Database"=>"Cap", "UID"=>"admin", "PWD"=>"password" );
		$conn = sqlsrv_connect( $serverName, $connectionInfo);
		if( $conn === false ) {
			 die( print_r( sqlsrv_errors(), true));
		}

		$stmt = sqlsrv_query( $conn, $query);
		if( $stmt === false ) {
			 die( print_r( sqlsrv_errors(), true));
		}
		$row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC);
		sqlsrv_free_stmt( $stmt);
		sqlsrv_close( $conn ); 
		
		$end = microtime_float();
		$time = $end - $start;
		return number_format($time, 3);
	}
	function MSSQLQuery()
	{	
		$string = (string)MSSQL("SELECT FieldNum, Random FROM Field1");//None option clause		
		$string .= " ";
		$string .= (string)MSSQL("SELECT FieldChar, Random FROM Field2");//None option clause
		$string .= " ";
		$string .= (string)MSSQL("SELECT FieldNum, FieldChar FROM Fields");//None option clause
		$string .= " ";
		$string .= (string)MSSQL("SELECT FieldNum, FieldChar, Address, Phone, Number FROM Lots");//None option clause
		$string .= " ";
		$string .= (string)MSSQL("SELECT FieldNum, Random FROM Field1 WHERE (FieldNum%10) = 1");//WHERE clause
		$string .= " ";
		$string .= (string)MSSQL("SELECT FieldChar, Random FROM Field2 WHERE FieldChar LIKE '_______'");//WHERE clause
		$string .= " ";
		$string .= (string)MSSQL("SELECT Fields.FieldNum, Field1.Random, Fields.FieldChar, Field2.Random FROM Fields 
						JOIN Field1 ON Fields.FieldNum = Field1.FieldNum
						JOIN Field2 ON Fields.FieldChar = Field2.FieldChar"); //JOIN clause
		$string .= " ";
		$string .= (string)MSSQL("SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
						JOIN Field1	ON Lots.FieldNum = Field1.FieldNum
						JOIN Field2	ON Lots.FieldChar = Field2.FieldChar"); //WHERE clause
	/*	*/
		echo $string;
		exit;
	}	
	function Oracle($query)
	{
		$start = microtime_float();
		
		//Connect to Oracle
		$conn = oci_connect('admin', 'password', 'oraclese.cfv2m251hguu.us-east-1.rds.amazonaws.com');
		if (!$conn) 
		{
			$e = oci_error();
			trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
		}

		// Prepare the statement
		$stid = oci_parse($conn, $query);
		if (!$stid) {
			$e = oci_error($conn);
			trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
		}

		// Perform the logic of the query
		$r = oci_execute($stid);
		if (!$r) {
			$e = oci_error($stid);
			trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
		}		
		oci_free_statement($stid);
		oci_close($conn);
		
		$end = microtime_float();
		$time = $end - $start;
		return number_format($time, 3);
	}
	function OracleQuery()
	{	
		$string = (string)Oracle("SELECT FieldNum, Random FROM Field1");//None option clause		
		$string .= " ";
		$string .= (string)Oracle("SELECT FieldChar, Random FROM Field2");//None option clause
		$string .= " ";
		$string .= (string)Oracle("SELECT FieldNum, FieldChar FROM Fields");//None option clause
		$string .= " ";
		$string .= (string)Oracle("SELECT FieldNum, FieldChar, Address, Phone, Number FROM Lots");//None option clause
		$string .= " ";
		$string .= (string)Oracle("SELECT FieldNum, Random FROM Field1 WHERE (FieldNum%10) = 1");//WHERE clause
		$string .= " ";
		$string .= (string)Oracle("SELECT FieldChar, Random FROM Field2 WHERE FieldChar LIKE '_______'");//WHERE clause
		$string .= " ";
		$string .= (string)Oracle("SELECT Fields.FieldNum, Field1.Random, Fields.FieldChar, Field2.Random FROM Fields 
						JOIN Field1 ON Fields.FieldNum = Field1.FieldNum
						JOIN Field2 ON Fields.FieldChar = Field2.FieldChar"); //JOIN clause
		$string .= " ";
		$string .= (string)Oracle("SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
						JOIN Field1	ON Lots.FieldNum = Field1.FieldNum
						JOIN Field2	ON Lots.FieldChar = Field2.FieldChar"); //WHERE clause
	
		echo $string;
		exit;
	}
	
	if (isset($_POST['action'])) 
	{
		switch ($_POST['action']) 
		{
			case 'MySQL':
				MySQLQuery();				
				break;
			case 'MSSQL':
				MSSQLQuery();
				break;
			case 'Oracle':
				OracleQuery();
				break;
		}
	}	
?>