using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dBQueryWebApp
{
    public partial class RemoveJob : System.Web.UI.Page
    {
        //private static string conString;
        private OracleConnection con;
        OracleCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            connectToDB();
        }

        private void connectToDB()
        {
            //conString = "User Id=COMP214_F19_ERS_18;Password=password;Data Source=199.212.26.208:1521/SQLD;";
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
        
        
        public void LoadTable()
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
        
        protected void btn_edit_job(object sender, EventArgs e)
        {
            cmd = new OracleCommand();
            cmd.Connection = con;
            cmd.CommandText = "new_job"; //name of the stored procedure;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("p_jobid", OracleDbType.Varchar2).Value = tb_job_id.Text; ;
            cmd.Parameters.Add("p_title", OracleDbType.Varchar2).Value = tb_job_title.Text;
            cmd.Parameters.Add("v_max_sal", OracleDbType.Varchar2).Value = Convert.ToInt32(tb_max_salary.Text);
            cmd.Parameters.Add("v_min_sal", OracleDbType.Varchar2).Value = Convert.ToInt32(tb_min_salary.Text);

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                lbl_stats.Text = "Edit unsuccessful: " + ex.Message;
            }
            con.Close();
        }
    }
}