using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project_Sharing.Models;

namespace Project_Sharing
{
    public partial class ViewProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ProjectSharingConnection"].ConnectionString);
                SqlCommand cmd = new SqlCommand();
                DataTable dt = new DataTable();
                connection.Open();
                cmd.Connection = connection;
                cmd.CommandText = "SELECT * FROM UserInfo WHERE UserFirstName='" + profile.firstname + "'AND UserLastName='" + profile.lastname + "'";
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                label_firsname.Text = dt.Rows[0]["UserFirstName"].ToString();
                label_lastname.Text = dt.Rows[0]["UserLastName"].ToString();
                label_email.Text = dt.Rows[0]["UserEmail"].ToString();
                label_type.Text = dt.Rows[0]["UserType"].ToString();
                label_resttype.Text = dt.Rows[0]["UserRestType"].ToString();
                label_address.Text = dt.Rows[0]["UserAddress"].ToString();
                label_tel.Text = dt.Rows[0]["UserTel"].ToString();
                label_age.Text = dt.Rows[0]["UserAge"].ToString();
                label_job.Text = dt.Rows[0]["UserJob"].ToString();
                label_school.Text = dt.Rows[0]["UserSchool"].ToString();
                label_logdate.Text = dt.Rows[0]["UserLogDate"].ToString();
                connection.Close();
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Sayfada " + ex.Message.ToString() + " Hatası Meydana geldi!');</script>");
            }

        }        
    }
}