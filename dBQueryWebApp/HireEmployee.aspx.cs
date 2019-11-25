using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;

namespace dBQueryWebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static string conString; 
        private OracleConnection con; 
        OracleCommand cmd; 
        protected void Page_Load(object sender, EventArgs e)
        {
            connectToDB();
            renderDropDowns();
        }

        private void connectToDB()
        {
            //conString = "User Id=COMP214_F19_ERS_18;Password=password;Data Source=199.212.26.208:1521/SQLD;";
            con = con = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["employeeDB"].ConnectionString);
            string message = "";
            try
            {
                con.Open();
                message = "Success: Connected to database: " + con.DatabaseName;
            }
            catch (Exception e)
            {
                message = "Error: Cannot connect to database " + e.Message;
            }
            finally
            {
                lblConnectStatus.Text = message;
            }

        }
        private void renderDropDowns()
        {
            //arrayList initialization
            var column = new List<string>();

            //job_id 
            column = getColumn("jobs", "job_id");
            foreach (string value in column)
            {
                ddl_job_id.Items.Add(value.ToString());

            }
            //ddl_manager_id
            var managers = new List<string>();
            managers = getManager(); //This is different from above 
            foreach (var value in managers)
            {

                ddl_manager_id.Items.Add(value);
                //lblColumn.Text = value;
            }

            //ddl_department_id
            var departments = new List<string>();
            departments = getDepartment(); //this is different from above
            foreach (var value in departments)
            {
                ddl_department_id.Items.Add(value);
            }

        }
        protected void btnShowProc_Click(object sender, EventArgs e)
        {
            cmd = new OracleCommand();
            cmd.Connection = con;
            cmd.CommandText = "Employee_hire_sp"; //name of the stored procedure;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("p_first_name",OracleDbType.Varchar2).Value = tb_first_name.Text;
            cmd.Parameters.Add("p_last_name", OracleDbType.Varchar2).Value = tb_last_name.Text;
            cmd.Parameters.Add("p_email", OracleDbType.Varchar2).Value = tb_email.Text;
            cmd.Parameters.Add("p_salary",OracleDbType.Double).Value = tb_salary.Text;
            var year = cal_hire_date.SelectedDate.Year;
            var month = cal_hire_date.SelectedDate.Month;
            var day = cal_hire_date.SelectedDate.Day;

            DateTime dateTime = new DateTime(year,month,day);
            cmd.Parameters.Add("p_hire_date",OracleDbType.Date).Value =dateTime;

            cmd.Parameters.Add("p_phone", OracleDbType.Varchar2).Value = tb_phone.Text;
            cmd.Parameters.Add("p_job_id", OracleDbType.Varchar2).Value = "IT_PROG";
            string[] mgr_id = ddl_manager_id.Text.Split();
            cmd.Parameters.Add("p_manager_id",OracleDbType.Int32).Value =Convert.ToInt32(mgr_id[0]);
            string[] dept_id = ddl_department_id.Text.Split();
            cmd.Parameters.Add("p_department_id", OracleDbType.Int32).Value =dept_id[0];
            try
            {
                         cmd.ExecuteNonQuery();  
            }
            catch (Exception ex)
            {
                if (ex.Message.Substring(0, 9) == "ORA-20202")
                {
                    lblName.Text = "Check salary Range";
                }
            }
            con.Close();
        }
        private List<string> getManager() {
            List<string> column = new List<string>();
            try
            {
                cmd = con.CreateCommand();
                cmd.BindByName = true;
                cmd.CommandText = "select distinct m.employee_id mId,m.last_name mln,m.first_name mfn from employees e join employees m on e.manager_id = m.employee_id ";
                //Execute the command and use DataReader to display the data
                OracleDataReader reader = cmd.ExecuteReader();
                
                while (reader.Read())
                {
                   
                    string eid = reader["mId"].ToString();
                    string efname = reader["mfn"].ToString();
                    string elname = reader["mln"].ToString();

                    string message = eid + " " + efname + " " + elname;

                    column.Add(message);
                    lblColumn.Text = message;  
                }

                reader.Dispose();
            }
            catch (Exception ex)
            {
                lblColumn.Text = ex.Message;
            }
            return column;
        }

        private List<string> getDepartment()
        {
            List<string> column = new List<string>();
            try
            {
                cmd = con.CreateCommand();
                cmd.BindByName = true;
                cmd.CommandText = "select department_id deptId, department_name deptName from departments order by department_id";
                //Execute the command and use DataReader to display the data
                OracleDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    string did = reader["deptId"].ToString();
                    string efname = reader["deptName"].ToString();


                    string message = did + " " + efname;

                    column.Add(message);
                    lblColumn.Text = message;

                }

                reader.Dispose();
            }
            catch (Exception ex)
            {
                lblColumn.Text = ex.Message;
            }
            return column;
        }

        //method that takes tableName and columnName and returns entire column from that table 
        private List<string> getColumn(string tableName, string columnName) {
            var column = new List<string>();
            try
            {
                cmd = con.CreateCommand();
                cmd.BindByName = true;
                cmd.CommandText = $"select distinct {columnName} from {tableName}";
                //Execute the command and use DataReader to display the data
                OracleDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    column.Add(reader.GetValue(0).ToString());  
                }

                reader.Dispose();
            }
            catch (Exception ex)
            {
                lblColumn.Text = ex.Message;
            }
            return column;
        }

        protected void btnShowColumn_Click(object sender, EventArgs e)
        {
            var column = new List<string>();
            column=getColumn("jobs","job_id");
            foreach(string value in column)
            {
                ddl_job_id.Items.Add(value.ToString());
            }
        }
        
        private string getColumn(string tableName, string columnName, string jid)
        {
            var column = "";
            try
            {
                cmd = con.CreateCommand();
                cmd.BindByName = true;
                cmd.CommandText = $"select distinct {columnName} from {tableName} where job_id=:jo_id";
                cmd.Parameters.Add("jo_id", jid);
                //Execute the command and use DataReader to display the data
                OracleDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    column = reader.GetString(0);
                }

                reader.Dispose();
            }
            catch (Exception ex)
            {
                //lbl_test.Text = ex.Message;
            }
            return column;
        }

        protected void ddl_job_id_SelectedIndexChanged(object sender, EventArgs e)
        {
            string j_Id = ((DropDownList)sender).SelectedValue;
       
            string st = getColumn("jobs", "job_title", j_Id);
            lbl_job_title.Text = st;
        }
    }
}

