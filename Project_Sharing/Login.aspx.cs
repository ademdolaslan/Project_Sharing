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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ProjectSharingConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd_getuser = new SqlCommand();
        public UserInfo userinfo = new UserInfo();
        public DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            try
            {
                cmd.Connection = connection;
                cmd.CommandText = "SELECT * FROM Users WHERE UserName='" + tbUserName.Text.ToString() + "'AND UserPassword='" + tbUserPassword.Text.ToString() + "'";
                connection.Open();
                SqlDataReader read = cmd.ExecuteReader();                
                if (read.Read())
                {
                    connection.Close();
                    connection.Open();
                    cmd_getuser.Connection = connection;
                    cmd_getuser.CommandText = "SELECT * FROM UserInfo WHERE UserName='" + tbUserName.Text.ToString() + "'AND UserPassword='" + tbUserPassword.Text.ToString() + "'";
                    SqlDataAdapter da = new SqlDataAdapter(cmd_getuser);
                    da.Fill(dt);                    
                    userinfo.UserFirsName = dt.Rows[0]["UserFirstName"].ToString();
                    userinfo.UserLastName = dt.Rows[0]["UserLastName"].ToString();
                    userinfo.UserEmail = dt.Rows[0]["UserEmail"].ToString();
                    userinfo.UserType = dt.Rows[0]["UserType"].ToString();
                    userinfo.UserRestType = dt.Rows[0]["UserRestType"].ToString();
                    userinfo.UserAddress = dt.Rows[0]["UserAddress"].ToString();
                    userinfo.UserTel = dt.Rows[0]["UserTel"].ToString();
                    userinfo.UserAge = dt.Rows[0]["UserAge"].ToString();
                    userinfo.UserJob = dt.Rows[0]["UserJob"].ToString();
                    userinfo.UserSchool = dt.Rows[0]["UserSchool"].ToString();
                    userinfo.UserLogDate = dt.Rows[0]["UserLogDate"].ToString();
                    userinfo.UserID= dt.Rows[0]["UserID"].ToString();
                    connection.Close();
                    Session["UserID"] = userinfo.UserID.ToString();
                    Session["UserFirstName"] = userinfo.UserFirsName.ToString();
                    Session["UserLastName"] = userinfo.UserLastName.ToString();
                    Session["UserEmail"] = userinfo.UserEmail.ToString();
                    Session["UserType"] = userinfo.UserType.ToString();
                    Session["UserRestType"] = userinfo.UserRestType.ToString();
                    Session["UserAddress"] = userinfo.UserAddress.ToString();
                    Session["UserTel"] = userinfo.UserTel.ToString();
                    Session["UserAge"] = userinfo.UserAge.ToString();
                    Session["UserJob"] = userinfo.UserJob.ToString();
                    Session["UserSchool"] = userinfo.UserSchool.ToString();
                    Session["UserLogDate"] = userinfo.UserLogDate.ToString();

                    //giriş yapan admin ise adminpanele girecek değil ise profil sayfasına



                    Response.Redirect("Profile.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kullanıcı Adı veya Şifre Hatalı');</script>");

                }
            }
            catch (Exception ex)
            {
               Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Sayfada " + ex.Message.ToString() + " Hatası Meydana geldi!');</script>");
            }
        }
    }
}