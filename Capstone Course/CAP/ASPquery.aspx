<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ASPquery.aspx.cs" Inherits="ASPquery" %>

<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<style>
table {
    border-collapse: collapse;
	box-shadow: 3px 3px 3px #888888;
}
table, td, th {
    border: 1px solid black;
}
</style>

    <title>ASP.NET Host</title>
</head>
<body>
    <h2 align="center">ASP.NET Query</h2>
     
    <form id="query" align="center" runat="server">
    <div align="center">
        <asp:Button ID="runMySQL" runat="server" Text="Run MySQL Query" OnClick="runMySQL_Click" />
        <br />
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>SELECT FieldNum, Random FROM Field1</asp:TableCell>
                <asp:TableCell ID="MySQL1" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldChar, Random FROM Field2</asp:TableCell>
                <asp:TableCell ID="MySQL2" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldNum, FieldChar FROM Fields</asp:TableCell>
                <asp:TableCell ID="MySQL3" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldNum, FieldChar, Address, Phone, Number FROM Lots</asp:TableCell>
                <asp:TableCell ID="MySQL4" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldNum, Random FROM Field1 WHERE (FieldNum%10) = 1</asp:TableCell>
                <asp:TableCell ID="MySQL5" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldChar, Random FROM Field2 WHERE FieldChar LIKE '_______'</asp:TableCell>
                <asp:TableCell ID="MySQL6" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><strike>SELECT Fields.FieldNum, Field1.Random, Fields.FieldChar, Field2.Random FROM Fields 
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Fields.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Fields.FieldChar = Field2.FieldChar</strike></asp:TableCell>
                <asp:TableCell ID="MySQL7" Text="NaN"></asp:TableCell>
            </asp:TableRow>
			<asp:TableRow>
                <asp:TableCell><strike>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar</strike></asp:TableCell>
                <asp:TableCell ID="MySQL8" Text="NaN"></asp:TableCell>
            </asp:TableRow>
			<asp:TableRow>
                <asp:TableCell>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar
					<br />&nbsp &nbsp &nbsp &nbsp WHERE ID < 100</asp:TableCell>
                <asp:TableCell ID="MySQL9" Text="NaN"></asp:TableCell>
            </asp:TableRow>
			<asp:TableRow>
                <asp:TableCell>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar
					<br />&nbsp &nbsp &nbsp &nbsp WHERE ID < 1000</asp:TableCell>
                <asp:TableCell ID="MySQL10" Text="NaN"></asp:TableCell>
            </asp:TableRow>
			<asp:TableRow>
                <asp:TableCell>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar
					<br />&nbsp &nbsp &nbsp &nbsp WHERE ID < 10000</asp:TableCell>
                <asp:TableCell ID="MySQL11" Text="NaN"></asp:TableCell>
            </asp:TableRow>
			<asp:TableRow>
                <asp:TableCell>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar
					<br />&nbsp &nbsp &nbsp &nbsp WHERE ID < 100000</asp:TableCell>
                <asp:TableCell ID="MySQL12" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar
					<br />&nbsp &nbsp &nbsp &nbsp WHERE ID < 1000000</asp:TableCell>
                <asp:TableCell ID="MySQL13" Text="NaN"></asp:TableCell>
            </asp:TableRow>
        </asp:Table><br />
		
        <asp:Button ID="runMSSQL" runat="server" Text="Run MSSQL Query" OnClick="runMSSQL_Click" />
        <br />
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>SELECT FieldNum, Random FROM Field1</asp:TableCell>
                <asp:TableCell ID="MSSQL1" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldChar, Random FROM Field2</asp:TableCell>
                <asp:TableCell ID="MSSQL2" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldNum, FieldChar FROM Fields</asp:TableCell>
                <asp:TableCell ID="MSSQL3" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldNum, FieldChar, Address, Phone, Number FROM Lots</asp:TableCell>
                <asp:TableCell ID="MSSQL4" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldNum, Random FROM Field1 WHERE (FieldNum%10) = 1</asp:TableCell>
                <asp:TableCell ID="MSSQL5" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldChar, Random FROM Field2 WHERE FieldChar LIKE '_______'</asp:TableCell>
                <asp:TableCell ID="MSSQL6" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><strike>SELECT Fields.FieldNum, Field1.Random, Fields.FieldChar, Field2.Random FROM Fields 
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Fields.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Fields.FieldChar = Field2.FieldChar</strike></asp:TableCell>
                <asp:TableCell ID="MSSQL7" Text="NaN"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><strike>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar</strike></asp:TableCell>
                <asp:TableCell ID="MSSQL8" Text="NaN"></asp:TableCell>
            </asp:TableRow>
			<asp:TableRow>
                <asp:TableCell>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar
					<br />&nbsp &nbsp &nbsp &nbsp WHERE ID < 100</asp:TableCell>
                <asp:TableCell ID="MSSQL9" Text="NaN"></asp:TableCell>
            </asp:TableRow>
			<asp:TableRow>
                <asp:TableCell>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar
					<br />&nbsp &nbsp &nbsp &nbsp WHERE ID < 1000</asp:TableCell>
                <asp:TableCell ID="MSSQL10" Text="NaN"></asp:TableCell>
            </asp:TableRow>
			<asp:TableRow>
                <asp:TableCell>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar
					<br />&nbsp &nbsp &nbsp &nbsp WHERE ID < 10000</asp:TableCell>
                <asp:TableCell ID="MSSQL11" Text="NaN"></asp:TableCell>
            </asp:TableRow>
			<asp:TableRow>
                <asp:TableCell>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar
					<br />&nbsp &nbsp &nbsp &nbsp WHERE ID < 100000</asp:TableCell>
                <asp:TableCell ID="MSSQL12" Text="NaN"></asp:TableCell>
            </asp:TableRow>
			<asp:TableRow>
                <asp:TableCell>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar
					<br />&nbsp &nbsp &nbsp &nbsp WHERE ID < 1000000</asp:TableCell>
                <asp:TableCell ID="MSSQL13" Text="NaN"></asp:TableCell>
            </asp:TableRow>
        </asp:Table><br />
		
        <asp:Button ID="runOracle" runat="server" Text="Run Oracle Query" OnClick="runOracle_Click" />
        <br />
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>SELECT FieldNum, Random FROM Field1</asp:TableCell>
                <asp:TableCell ID="Oracle1"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldChar, Random FROM Field2</asp:TableCell>
                <asp:TableCell ID="Oracle2"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldNum, FieldChar FROM Fields</asp:TableCell>
                <asp:TableCell ID="Oracle3"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldNum, FieldChar, Address, Phone, Number FROM Lots</asp:TableCell>
                <asp:TableCell ID="Oracle4"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldNum, Random FROM Field1 WHERE (FieldNum%10) = 1</asp:TableCell>
                <asp:TableCell ID="Oracle5"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT FieldChar, Random FROM Field2 WHERE FieldChar LIKE '_______'</asp:TableCell>
                <asp:TableCell ID="Oracle6"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT Fields.FieldNum, Field1.Random, Fields.FieldChar, Field2.Random FROM Fields 
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Fields.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Fields.FieldChar = Field2.FieldChar</asp:TableCell>
                <asp:TableCell ID="Oracle7"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field1 ON Lots.FieldNum = Field1.FieldNum
					<br />&nbsp &nbsp &nbsp &nbsp JOIN Field2 ON Lots.FieldChar = Field2.FieldChar</asp:TableCell>
                <asp:TableCell ID="Oracle8"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>
    </form>
</body>
</html>
