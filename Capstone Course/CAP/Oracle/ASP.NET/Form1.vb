Imports Oracle.DataAccess.Client

Public Class Form1

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                    + "(ADDRESS=(PROTOCOL=TCP)(HOST=ORASRVR)(PORT=1521)))" _
                    + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                    + "User Id=scott;Password=tiger;"

        Using conn As New OracleConnection(oradb)
            Try
                conn.Open()

                Using cmd As New OracleCommand()
                    cmd.Connection = conn

                    ' Lab 1 select string
                    cmd.CommandText = "select dname from dept where deptno = 10"
                    ' Lab 2 select string, invalid inputs cause an error
                    'cmd.CommandText = "select deptno, dname, loc from dept where deptno = " + TextBox1.Text
                    ' Lab 3 select string
                    'cmd.CommandText = "select deptno, dname, loc from dept"

                    cmd.CommandType = CommandType.Text

                    Using dr As OracleDataReader = cmd.ExecuteReader()

                        ' Labs 1 and 2 data retrieval
                        dr.Read()

                        ' Labs 1 and 2 assign data to label
                        Label1.Text = dr.Item("dname") ' retrieve by column name
                        ' Lab 2 assign data to label
                        'Label1.Text = dr.Item(1) ' retrieve by column ordinal just to be different

                        ' Lab 3 data retrieval, must comment out previous dr.Read()
                        'While dr.Read()
                        '    ListBox1.Items.Add("The " + dr.Item("dname") + _
                        '    " department is in " + dr.Item("loc"))
                        'End While
                    End Using
                End Using
            Catch ex As OracleException ' catches only Oracle errors
                Select Case ex.Number
                    Case 1
                        MessageBox.Show("Error attempting to insert duplicate data.")
                    Case 12545
                        MessageBox.Show("The database is unavailable.")
                    Case Else
                        MessageBox.Show("Database error: " + ex.Message.ToString())
                End Select
                ' Alternate syntax for error handling
                'If InStr(1, ex.Message.ToString(), "ORA-1:", CompareMethod.Text) Then
                '    MessageBox.Show("Error attempting to insert duplicate data.")
                'ElseIf InStr(1, ex.Message.ToString(), "ORA-12545:", CompareMethod.Text) Then
                '    MessageBox.Show("The database is unavailable.")
                'Else
                '    MessageBox.Show("Database error: " + ex.Message.ToString())
                'End If
            Catch ex As Exception ' catches any error
                MessageBox.Show(ex.Message.ToString())
            Finally
                ' Don't need conn.Close() because the Using takes care of it.
            End Try
        End Using
    End Sub
End Class
