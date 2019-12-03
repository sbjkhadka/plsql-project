using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dBQueryWebApp
{
    public partial class EditJobDescription : System.Web.UI.Page
    {
        private OracleConnection con;
        OracleCommand cmd;
        private List<string> job_ID_List;
        protected void Page_Load(object sender, EventArgs e)
        {
            connectToDB();
            renderDropDown();
        }
        private void connectToDB()
        {
            con = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["employeeDB"].ConnectionString);
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
                lbl_stats.Text = message;
            }

        }
        private void renderDropDown()
        {
            job_ID_List = getColumn("jobs", "job_id");
            foreach (string value in job_ID_List)
            {
                ddl_job_id.Items.Add(value.ToString());

            }
        }
        public List<string> getColumn(string tableName, string columnName)
        {

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
                //lbl_test.Text = ex.Message;
            }
            return column;
        }
        public  void LoadTable()
        {
                connectToDB();
                cmd = new OracleCommand();
                cmd.Connection = con;
                cmd.CommandText = "select * from jobs";
                OracleDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
  
                    Response.Write("<table border='1'>");
                    Response.Write("<tr><th>Name</th><th>Roll No</th><th>Minimum Salary</th><th>Maximum Salary</th></tr>");
                while (dr.Read())
                    {
                        Response.Write("<tr>");
                        Response.Write("<td>" + dr["job_id"].ToString() + "</td>");
                        Response.Write("<td>" + dr["job_title"].ToString() + "</td>");
                        Response.Write("<td>" + dr["min_salary"].ToString() + "</td>");
                        Response.Write("<td>" + dr["max_salary"].ToString() + "</td>");
                    Response.Write("</tr>");
                    }
                    Response.Write("</table>");
                }
                else
                {
                    Response.Write("No Data In DataBase");
                }
                con.Close();
            
        }

        //method that takes tablename, columnname and equality search criteria and retrurn a single value
        private void getColumn(string jid)
        {
            try
            {
                cmd = con.CreateCommand();
                cmd.BindByName = true;
                cmd.CommandText = $"select distinct job_title,max_salary,min_salary from jobs where job_id=:jo_id";
                cmd.Parameters.Add("jo_id", jid);
                //Execute the command and use DataReader to display the data
                OracleDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    tb_job_title.Text = reader["job_title"].ToString();
                    tb_max_salary.Text =reader["max_salary"].ToString();
                    tb_min_salary.Text = reader["min_salary"].ToString();
                }

                reader.Dispose();
            }
            catch (Exception ex)
            {
                lbl_stats.Text = ex.Message;
            }
        }

        protected void ddl_job_id_SelectedIndexChanged(object sender, EventArgs e)
        {
            getColumn(((DropDownList)sender).SelectedValue);
        }

        protected void btn_edit_job(object sender, EventArgs e)
        {
            cmd = new OracleCommand();
            cmd.Connection = con;
            cmd.CommandText = "change_job_desc"; //name of the stored procedure;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("p_job_id", OracleDbType.Varchar2).Value = ddl_job_id.SelectedValue;
            cmd.Parameters.Add("p_job_title", OracleDbType.Varchar2).Value = tb_job_title.Text;
            double maxSal, minSal;
            bool parseMaxSal = double.TryParse(tb_max_salary.Text, out maxSal);
            bool parseMinSal = double.TryParse(tb_max_salary.Text, out minSal);
            if (parseMaxSal || parseMinSal) {
                cmd.Parameters.Add("p_job_max_sal", OracleDbType.Varchar2).Value = Convert.ToInt32(tb_max_salary.Text);
                cmd.Parameters.Add("p_job_min_sal", OracleDbType.Varchar2).Value = Convert.ToInt32(tb_min_salary.Text);
            }
                
       
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                lbl_stats.Text = "Edit Unsuccessful: " + ex.Message;
            }
            con.Close();
        }
    }
}