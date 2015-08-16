

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style>
table {
    border-collapse: collapse;
	box-shadow: 3px 3px 3px #888888;
}

table, td, th {
    border: 1px solid black;
}
</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>	
<script>
function runQuery(sql) 
{
	document.getElementById(sql).innerHTML = "Executing...";
	
	if (window.XMLHttpRequest) 
	{
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} 
	else 
	{
		// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange = function() 
	{
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
		{
			var arr = xmlhttp.responseText.split(" ");			
			document.getElementById(sql+"1").innerHTML = arr[0];
			document.getElementById(sql+"2").innerHTML = arr[1];
			document.getElementById(sql+"3").innerHTML = arr[2];
			document.getElementById(sql+"4").innerHTML = arr[3];
			document.getElementById(sql+"5").innerHTML = arr[4];
			document.getElementById(sql+"6").innerHTML = arr[5];
			document.getElementById(sql+"7").innerHTML = arr[6];
			document.getElementById(sql+"8").innerHTML = arr[7];
			document.getElementById(sql).innerHTML = sql+" Querys";
		}
	}
	xmlhttp.open("POST","query.php",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("action="+sql);

}
</script>    

<title>PHP Host</title>
</head>

<body>

	<div align="center">
	<h2> <?php echo "PHP Query"; ?></h2>
	
	
	<button id="MySQL" onclick="runQuery('MySQL')">Run MySQL Querys</button><br /><br />
		<table>
		<tr>
			<td >SELECT FieldNum, Random FROM Field1</td>
			<td id="MySQL1">NaN</td>
		</tr><tr>
			<td>SELECT FieldChar, Random FROM Field2</td>
			<td id="MySQL2">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT FieldNum, FieldChar FROM Fields</td>
			<td id="MySQL3">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT FieldNum, FieldChar, Address, Phone, Number FROM Lots</td>
			<td id="MySQL4">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT FieldNum, Random FROM Field1 WHERE (FieldNum%10) = 1</td>
			<td id="MySQL5">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT FieldChar, Random FROM Field2 WHERE FieldChar LIKE '_______'</td>
			<td id="MySQL6">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT Fields.FieldNum, Field1.Random, Fields.FieldChar, Field2.Random FROM Fields 
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Fields.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Fields.FieldChar = Field2.FieldChar</td>
			<td id="MySQL7">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar</td>
			<td id="MySQL8">NaN</td>
		</tr>
		</table><br />
	
	<button id="MSSQL" onclick="runQuery('MSSQL')">Run SQL Server Querys</button><br />
		<table>
		<tr>
			<td >SELECT FieldNum, Random FROM Field1</td>
			<td id="MSSQL1">NaN</td>
		</tr><tr>
			<td>SELECT FieldChar, Random FROM Field2</td>
			<td id="MSSQL2">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT FieldNum, FieldChar FROM Fields</td>
			<td id="MSSQL3">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT FieldNum, FieldChar, Address, Phone, Number FROM Lots</td>
			<td id="MSSQL4">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT FieldNum, Random FROM Field1 WHERE (FieldNum%10) = 1</td>
			<td id="MSSQL5">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT FieldChar, Random FROM Field2 WHERE FieldChar LIKE '_______'</td>
			<td id="MSSQL6">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT Fields.FieldNum, Field1.Random, Fields.FieldChar, Field2.Random FROM Fields 
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Fields.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Fields.FieldChar = Field2.FieldChar</td>
			<td id="MSSQL7">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar</td>
			<td id="MSSQL8">NaN</td>
		</tr>
		</table><br />
	
	<button id="Oracle" onclick="runQuery('Oracle')">Run Oracle Querys</button><br />
		<table>
		<tr>
			<td >SELECT FieldNum, Random FROM Field1</td>
			<td id="Oracle1">NaN</td>
		</tr><tr>
			<td>SELECT FieldChar, Random FROM Field2</td>
			<td id="Oracle2">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT FieldNum, FieldChar FROM Fields</td>
			<td id="Oracle3">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT FieldNum, FieldChar, Address, Phone, Number FROM Lots</td>
			<td id="Oracle4">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT FieldNum, Random FROM Field1 WHERE (FieldNum%10) = 1</td>
			<td id="Oracle5">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT FieldChar, Random FROM Field2 WHERE FieldChar LIKE '_______'</td>
			<td id="Oracle6">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT Fields.FieldNum, Field1.Random, Fields.FieldChar, Field2.Random FROM Fields 
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Fields.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Fields.FieldChar = Field2.FieldChar</td>
			<td id="Oracle7">NaN</td>
		</tr>
		</tr><tr>
			<td>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar</td>
			<td id="Oracle8">NaN</td>
		</tr>
		</table>
	
</body>
</html>