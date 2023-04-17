using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace MYSQLDBConnectWithWebsiteMaster.StudentMajorMinor
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public void validateCredentialsLogin(object sender, EventArgs e)
        {
            String selectemail = "select count(*) from tblstudent where Emailid ='"+exampleInputEmail1.Value.Trim()+"'";
            string selectpass = "select count(*) from tblstudent where Emailid ='" + exampleInputEmail1.Value.Trim() + "' and Feedbackpassword = '"+exampleInputPassword1.Value.Trim()+"'";
            try
            {
                MySqlConnection connection = new MySqlConnection("server = localhost; user id = root; database = studentdb");
                connection.Open();
                MySqlCommand cmd = new MySqlCommand(selectemail, connection);
                int userExist = Int32.Parse(cmd.ExecuteScalar().ToString());
                if (userExist > 0)
                {
                    cmd = new MySqlCommand(selectpass, connection);
                    int passcheck = Int32.Parse(cmd.ExecuteScalar().ToString());

                    if (passcheck > 0)
                    {
                        Session["useremail"] = exampleInputEmail1.Value.ToString();
                        Response.Redirect("../StudentMajorMinor/Sem4MejorMinor.aspx");
                    }
                    else
                    {
                        Validationlbl.Text = "Invalide credentials";
                    }
                }
                else
                {
                    Validationlbl.Text = "No Such Email Id";
                }
                cmd.Dispose();
                connection.Close();
            }
            catch (Exception ex)
            {

            }

        }
    }
}