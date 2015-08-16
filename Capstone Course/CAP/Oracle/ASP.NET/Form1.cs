using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Oracle.DataAccess.Client;

namespace OraWinAppCS
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
			// be sure to replace OTNSRVR with your host's name
			string oradb = "Data Source=(DESCRIPTION="              // C#
                + "(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=ORASRVR)(PORT=1521)))"
				+ "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));"
				+ "User Id=scott;Password=tiger;";

			using (OracleConnection conn = new OracleConnection(oradb))
            {
			    try
			    {
				    conn.Open();

				    using (OracleCommand cmd = new OracleCommand())
                    {
				        cmd.Connection = conn;
				        // Lab 1 select string
                        cmd.CommandText = "select dname from dept where deptno = 10";
				        // Lab 2 select string
                        //cmd.CommandText = "select deptno, dname, loc from dept where deptno = " + textBox1.Text;
				        // Lab 3 select string
                        //cmd.CommandText = "select deptno, dname, loc from dept";

				        cmd.CommandType = CommandType.Text;

				        using (OracleDataReader dr = cmd.ExecuteReader())
                        {
				            // Labs 1 and 2 data retrieval
                            dr.Read();

                            // Lab 1 assign data to label
                            label1.Text = dr["dname"].ToString();
                            // Lab 2 assign data to label
                            //label1.Text = dr["dname"].ToString();

                            // Lab 3 data retrieval, must comment out previous dr.Read()
                            //while (dr.Read())
                            //{
                            //    listBox1.Items.Add("The " + dr["dname"].ToString() +
                            //        " department is in " + dr["loc"].ToString());
                            //}
                        }
                    }
                }
			    catch (OracleException ex) // catches only Oracle errors
			    {
				    switch (ex.Number)
				    {
					    case 1:
						    MessageBox.Show("Error attempting to insert duplicate data.");
						    break;
					    case 12545:
						    MessageBox.Show("The database is unavailable.");
						    break;
					    default:
						    MessageBox.Show("Database error: " + ex.Message.ToString());
						    break;
				    }
			    }
			    catch (Exception ex) // catches any other error
			    {
				    MessageBox.Show(ex.Message.ToString());
			    }
			    finally
			    {
                    // Don't need conn.Close() because the using takes care of it.
			    }
            }
        }
    }
}
