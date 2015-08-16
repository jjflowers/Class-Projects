<?php
if (isset($_POST['action'])) {
    switch ($_POST['action']) {
        case 'insert':
            insert();
            break;
        case 'select':
            select();
            break;
    }
}

function select() {
    echo "[\"asdf\",\"qwer\"]";
    exit;
}

function insert() {
    echo "The insert function is called.";
    exit;
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />




<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
function showUser(strclick) 
{
    
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
			var arr = xmlhttp.responseText;
			alert("asdf"+arr);
			document.getElementById("call").innerHTML = arr[0]+arr[1];
		}
	}
	xmlhttp.open("POST","ajax.php",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("action="+strclick);

}
</script>  

<title>PHP Host</title>
</head>

<body>
<input type="submit" class="button" name="insert" value="insert" onclick="showUser('insert')"/>
<input type="submit" class="button" name="select" value="select" onclick="showUser('select')"/><br >
<div id="call">asdf</div>

	
</body>
</html>