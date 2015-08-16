using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


public partial class ASPquery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void runMySQL_Click(object sender, EventArgs e)
    {
        runMySQL.Text = "Executing...";

        MySQL1.Text = MySQLQuery("SELECT FieldNum, Random FROM Field1").ToString("0.###");
        MySQL2.Text = MySQLQuery("SELECT FieldChar, Random FROM Field2").ToString("0.###");
        MySQL3.Text = MySQLQuery("SELECT FieldNum, FieldChar FROM Fields").ToString("0.###");
        MySQL4.Text = MySQLQuery("SELECT FieldNum, FieldChar, Address, Phone, Number FROM Lots").ToString("0.###");
        MySQL5.Text = MySQLQuery("SELECT FieldNum, Random FROM Field1 WHERE (FieldNum%10) = 1").ToString("0.###");
        MySQL6.Text = MySQLQuery("SELECT FieldChar, Random FROM Field2 WHERE FieldChar LIKE '_______'").ToString("0.###");
    //    MySQL7.Text = MySQLQuery("SELECT Fields.FieldNum, Field1.Random, Fields.FieldChar, Field2.Random FROM Fields " +
    //        "JOIN Field1 ON Fields.FieldNum = Field1.FieldNum " +
    //        "JOIN Field2 ON Fields.FieldChar = Field2.FieldChar").ToString("0.###");
    //    MySQL8.Text = MySQLQuery("SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots " +
    //        "JOIN Field1 ON Lots.FieldNum = Field1.FieldNum " +
    //        "JOIN Field2 ON Lots.FieldChar = Field2.FieldChar").ToString("0.###");
        MySQL9.Text = MySQLQuery("SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots " +
              "JOIN Field1 ON Lots.FieldNum = Field1.FieldNum " +
              "JOIN Field2 ON Lots.FieldChar = Field2.FieldChar " +
              "WHERE ID < 100").ToString("0.###");
		//MySQL10.Text = MySQLQuery().ToString("0.###");
		//MySQL11.Text = MySQLQuery().ToString("0.###");
		//MySQL12.Text = MySQLQuery().ToString("0.###");
		//MySQL13.Text = MySQLQuery().ToString("0.###");

        runMySQL.Text = "MySQL Querys";
    }
    protected double MySQLQuery(string query)
    {
        DateTime start = DateTime.Now;


        MySqlConnection conn = new MySqlConnection(); ;

        string myConnectionString = "server=mysql.cfv2m251hguu.us-east-1.rds.amazonaws.com;uid=admin;" +
            "pwd=password;database=Cap;";

        try
        {
            conn.ConnectionString = myConnectionString;
            conn.Open();

            MySqlCommand myCommand = new MySqlCommand(query, conn);
            myCommand.CommandTimeout = 600;
            MySqlDataReader myReader = myCommand.ExecuteReader();
            //while (myReader.Read())
            //{
            //    Console.WriteLine(myReader["Column1"].ToString());
            //    Console.WriteLine(myReader["Column2"].ToString());
            //}
            conn.Close();
        }
        catch (MySqlException ex)
        {
            //MessageBox.Show(ex.Message);
            return -1;
        }


        DateTime end = DateTime.Now;
        double time = (end - start).TotalSeconds;
        return time;
    }
    protected void runMSSQL_Click(object sender, EventArgs e)
    {
        runMSSQL.Text = "Executing...";

        MSSQL1.Text = MSSQLQuery("SELECT FieldNum, Random FROM Field1").ToString("0.###");
        MSSQL2.Text = MSSQLQuery("SELECT FieldChar, Random FROM Field2").ToString("0.###");
        MSSQL3.Text = MSSQLQuery("SELECT FieldNum, FieldChar FROM Fields").ToString("0.###");
        MSSQL4.Text = MSSQLQuery("SELECT FieldNum, FieldChar, Address, Phone, Number FROM Lots").ToString("0.###");
        MSSQL5.Text = MSSQLQuery("SELECT FieldNum, Random FROM Field1 WHERE (FieldNum%10) = 1").ToString("0.###");
        MSSQL6.Text = MSSQLQuery("SELECT FieldChar, Random FROM Field2 WHERE FieldChar LIKE '_______'").ToString("0.###");
    //    MSSQL7.Text = MSSQLQuery("SELECT Fields.FieldNum, Field1.Random, Fields.FieldChar, Field2.Random FROM Fields " +
    //        "JOIN Field1 ON Fields.FieldNum = Field1.FieldNum " +
    //        "JOIN Field2 ON Fields.FieldChar = Field2.FieldChar").ToString("0.###");
    //    MSSQL8.Text = MSSQLQuery("SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots " +
    //        "JOIN Field1	ON Lots.FieldNum = Field1.FieldNum " +
    //        "JOIN Field2 ON Lots.FieldChar = Field2.FieldChar").ToString("0.###");
        MSSQL9.Text = MSSQLQuery("SELECT Lots.ID, Lots.FieldNum, Field1.Random, Lots.FieldChar, Field2.Random, Lots.Address, Lots.Phone, Lots.Number FROM Lots " +
              "JOIN Field1 ON Lots.FieldNum = Field1.FieldNum " +
              "JOIN Field2 ON Lots.FieldChar = Field2.FieldChar " +
              "WHERE ID < 100").ToString("0.###");
	//  MSSQL10.Text = MSSQLQuery().ToString("0.###");
	//	MSSQL11.Text = MSSQLQuery().ToString("0.###");
	//	MSSQL12.Text = MSSQLQuery().ToString("0.###");
	//	MSSQL13.Text = MSSQLQuery().ToString("0.###");

        runMSSQL.Text = "SQL Server Query";
    }
    protected double MSSQLQuery(string query)
    {
        DateTime start = DateTime.Now;

        SqlConnection myConnection = new SqlConnection("user id=admin;" +
                                      "password=password;server=sqlserver.cfv2m251hguu.us-east-1.rds.amazonaws.com,1433;" +
                                      "Trusted_Connection=no;" +
                                      "database=Cap; " +
                                      "connection timeout=600");
        try
        {
            SqlCommand myCommand = new SqlCommand(query, myConnection);
            myCommand.CommandTimeout = 600;
            myConnection.Open();

            SqlDataReader myReader = myCommand.ExecuteReader();
            //while (myReader.Read())
            //{
            //    Console.WriteLine(String.Format("{0}, {1}",
            //    myReader[0], myReader[1]));

            //}
            myConnection.Close();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
            return -1;
        }


        DateTime end = DateTime.Now;
        double time = (end - start).TotalSeconds;
        return time;
    }
    protected void runOracle_Click(object sender, EventArgs e)
    {

    }
    protected double OracleQuery(string query)
    {
        DateTime start = DateTime.Now;



        DateTime end = DateTime.Now;
        double time = (end - start).TotalMilliseconds;
        return time;
    }
}