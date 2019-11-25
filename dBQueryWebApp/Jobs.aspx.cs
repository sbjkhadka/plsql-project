using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dBQueryWebApp
{
    public partial class Jobs : System.Web.UI.Page
    {

        //private static string conString;
        private OracleConnection con;
        OracleCommand cmd;
        private List<string> job_ID_List;
        //method that takes tableName and columnName and returns entire column from that table 
       
        protected void Page_Load(object sender, EventArgs e)
        {
            connectToDB();
            renderDropDown();
            string j_Id = ddl_job_title_Search.SelectedValue;
            string st = getColumn("jobs", "job_title", j_Id);
            lbl_value.Text = st;
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
                lbl_test.Text = message;
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
                lbl_test.Text = ex.Message;
            }
            return column;
        }
        private void renderDropDown()
        {
            job_ID_List = getColumn("jobs","job_id");
            foreach (string value in job_ID_List)
            {
                ddl_job_title_Search.Items.Add(value.ToString());

            }
        }

        protected void ddl_job_title_Search_SelectedIndexChanged(object sender, EventArgs e)
        {
            string j_Id = ((DropDownList) sender).SelectedValue;
            string st= getColumn("jobs", "job_title", j_Id);
            lbl_value.Text = st;
        }

        //method that takes tablename, columnname and equality search criteria and retrurn a single value
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
                lbl_test.Text = ex.Message;
            }
            return column;
        }
    }
}