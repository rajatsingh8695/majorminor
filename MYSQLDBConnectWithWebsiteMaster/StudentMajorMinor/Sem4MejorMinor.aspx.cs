using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.Data;


namespace MYSQLDBConnectWithWebsiteMaster.StudentMajorMinor
{
    public partial class Sem4MejorMinor : System.Web.UI.Page
    {
        //adding git comment
        
        bool minorselection;
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowSemesterMajorMinorSubjects.Visible = false;
            if (!IsPostBack)
            {
            }
            fetchstudentdetails();
        }

        public void fetchstudentdetails()
        {
            try
            {
                string majorselected="", minorselected="";
                String selectRecord = "select major,minor from stdmajorminorlist where Rollno=?rollno";
                String selectdetails = "select Rollno,NAME,Batch,Course_ab from tblstudent where Emailid ='" + Session["useremail"].ToString() + "'";
                MySqlConnection connection = new MySqlConnection("server = localhost; user id = root; database = studentdb");
                connection.Open();
                MySqlCommand cmd = new MySqlCommand(selectdetails, connection);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        lblrollno.Text = dr.GetString("Rollno");
                        lblname.Text = dr.GetString("NAME");
                        lblbatch.Text = dr.GetString("Batch");
                        lblcourse.Text = dr.GetString("Course_ab");
                    }
                }
                dr.Close();
                cmd = new MySqlCommand(selectRecord, connection);
                cmd.Parameters.AddWithValue("?rollno", lblrollno.Text.ToString());
                MySqlDataReader dr1 = cmd.ExecuteReader();
                if (dr1.HasRows)
                {
                    while (dr1.Read())
                    {
                        majorselected = dr1.GetString("major");
                        minorselected = dr1.GetString("minor");
                    }
                    minorRadioList.Items.FindByText(minorselected).Selected = true;
                    majorRadioList.Items.FindByText(majorselected).Selected = true;
                    majorRadioList.Enabled = false;
                    Button1.Visible = false;
                    btnsubmitmajorminor.Visible = false;
                    submitbtn.Visible = false;
                    Button1_Click(new object(), new EventArgs());
                }
                dr.Close();
                connection.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        protected void ShowMinor(object sender, EventArgs e)
        {
            for (int i = 0; i < minorRadioList.Items.Count; i++)
            {
                minorRadioList.Items[i].Enabled = true;
            }
           minorRadioList.Enabled = true;
            minorRadioList.ClearSelection();
            string value = majorRadioList.SelectedItem.Value.ToString();
            minorRadioList.Items[(Int32.Parse(value))-1].Enabled = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (majorRadioList.SelectedIndex==-1 || minorRadioList.SelectedIndex==-1)
                MessageBox.Show("Please Select Major and Minor ");
            else
            {
                ShowSemesterMajorMinorSubjects.Visible = true;
                minorselection = true;
                try
                {
                    
                    String commandforSem4 = "SELECT `Type`,`Special`,`CourseName`, `Hours`, `Marks` FROM `majormonir` WHERE Type='major' and Special='" + majorRadioList.SelectedItem.ToString().Trim() + "' and Trim='IV' UNION (SELECT `Type`,`Special`, `CourseName`, `Hours`, `Marks` FROM `majormonir` WHERE Type='Minor' and Special='" + minorRadioList.SelectedItem.ToString().Trim() + "' and Trim='IV')";
                    String commandforSem5 = "SELECT `Type`,`Special`,`CourseName`, `Hours`, `Marks` FROM `majormonir` WHERE Type='major' and Special='" + majorRadioList.SelectedItem.ToString().Trim() + "' and Trim='V' UNION (SELECT `Type`,`Special`,`CourseName`, `Hours`, `Marks` FROM `majormonir` WHERE Type='Minor' and Special='" + minorRadioList.SelectedItem.ToString().Trim() + "' and Trim='V')";
                    String commandforSem6 = "SELECT `Type`,`Special`,`CourseName`, `Hours`, `Marks` FROM `majormonir` WHERE Type='major' and Special='" + majorRadioList.SelectedItem.ToString().Trim() + "' and Trim='VI' UNION (SELECT `Type`,`Special`,`CourseName`, `Hours`, `Marks` FROM `majormonir` WHERE Type='Minor' and Special='" + minorRadioList.SelectedItem.ToString().Trim() + "' and Trim='VI')";
                    MySqlConnection connection = new MySqlConnection("server = localhost; user id = root; database = studentdb");
                    connection.Open();
                    MySqlCommand cmd = new MySqlCommand(commandforSem4, connection);
                    MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    adp.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    cmd.Dispose();


                    cmd = new MySqlCommand(commandforSem5, connection);
                    adp = new MySqlDataAdapter(cmd);
                    ds = new DataSet();
                    adp.Fill(ds);
                    GridView2.DataSource = ds;
                    GridView2.DataBind();
                    cmd.Dispose();


                    cmd = new MySqlCommand(commandforSem6, connection);
                    adp = new MySqlDataAdapter(cmd);
                    ds = new DataSet();
                    adp.Fill(ds);
                    GridView3.DataSource = ds;
                    GridView3.DataBind();
                    cmd.Dispose();

                    connection.Close();

                    lblmodalrollno.Text = lblrollno.Text;
                    lblmodalname.Text = lblname.Text;
                    lblmodalbatch.Text = lblbatch.Text;
                    lblmodalcourse.Text = lblcourse.Text;
                    lblmodalemail.Text = Session["useremail"].ToString();
                    lblmodalmajor.Text = majorRadioList.SelectedItem.Text.ToString();
                    lblmodalminor.Text = minorRadioList.SelectedItem.Text.ToString();
                }
                catch (Exception ex)
                {

                }
            }
        }
        protected void Reset_Click(object sender,EventArgs e)
        {
            minorRadioList.ClearSelection();
            majorRadioList.ClearSelection();
            minorRadioList.Enabled = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
        }

        protected void minorRadioList_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void modal_show_button_click(object sender, EventArgs e)
        {

            try
            {
                string insertmajorminordetails1 = "INSERT INTO `stdmajorminorlist`(`Rollno`, `NAME`, `Batch`, `Course_ab`, `Emailid`, `major`, `minor`) VALUES(?rollno, ?name,?batch ,?course , ?email, ?major, ?minor)";
                MySqlConnection connection = new MySqlConnection("server = localhost; user id = root; database = studentdb");
                connection.Open();
                MySqlCommand cmd = new MySqlCommand(insertmajorminordetails1, connection);
                cmd.Parameters.AddWithValue("?rollno", lblmodalrollno.Text.ToString());
                cmd.Parameters.AddWithValue("?name", lblmodalname.Text.ToString());
                cmd.Parameters.AddWithValue("?batch", lblmodalbatch.Text.ToString());
                cmd.Parameters.AddWithValue("?course", lblmodalcourse.Text.ToString());
                cmd.Parameters.AddWithValue("?email", lblmodalemail.Text.ToString());
                cmd.Parameters.AddWithValue("?major", lblmodalmajor.Text.ToString());
                cmd.Parameters.AddWithValue("?minor", lblmodalminor.Text.ToString());

                cmd.ExecuteNonQuery();
                MessageBox.Show("Inserted Successfully");
                connection.Close();
                
                Response.Redirect("../StudentMajorMinor/Sem4MejorMinor.aspx");
            }
            catch (Exception ex)
            {
                Console.Write("Error occurred." + ex);
            }
        }
    }
}
