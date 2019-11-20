using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project_Sharing.Models;

namespace Project_Sharing
{
    public partial class Register : Page
    {
        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ProjectSharingConnection"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd_check = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            


        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            if (DDLUserType.SelectedValue.ToString() == "0")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Lütfen kısa tanım listesinden birini seçiniz.');</script>");
            }
            else
            {
                if (cbAccept.Checked == true)
                {

                    try
                    {
                        cmd.Connection = connection;
                        cmd_check.Connection = connection;
                        connection.Open();
                        var user = new UserModel()
                        {
                            UserFirsName = tbUserFirstName.Text.ToString(),
                            UserLastName = tbUserLastName.Text.ToString(),
                            UserName = tbUserName.Text.ToString(),
                            UserPassWord = tbUserPassWord.Text.ToString(),
                            UserEmail = tbUserEmail.Text.ToString(),
                            UserType = DDLUserType.SelectedValue.ToString(),
                            UserRestID = "1",
                            UserAddress = tbUserAddress.Text.ToString(),
                            UserTel = tbUserTel.Text.ToString(),
                            UserAge = tbUserAge.Text.ToString(),
                            UserJob = tbUserJob.Text.ToString(),
                            UserSchool = tbUserSchool.Text.ToString(),
                        };
                        cmd_check.CommandText = "SELECT UserName FROM Users WHERE UserName='" + user.UserName.ToString() + "'";
                        SqlDataReader read = cmd_check.ExecuteReader();
                        if (read.Read())
                        {
                            Response.Write("<script>alert('Bu kullanıcı adı daha önceden alınmış')</script>");
                        }

                        else
                        {
                            connection.Close();
                            connection.Open();
                            cmd.CommandText = "INSERT INTO Users (UserFirstName, UserLastName, UserName, UserPassword, UserEmail, UserTypeID, UserRestID, UserAddress, UserTel, UserAge, UserJob, UserSchool) VALUES (@UserFirstName, @UserLastName, @UserName, @UserPassword, @UserEmail, @UserTypeID, @UserRestID, @UserAddress, @UserTel, @UserAge, @UserJob, @UserSchool)";
                            cmd.Parameters.AddWithValue("@UserFirstName", user.UserFirsName);
                            cmd.Parameters.AddWithValue("@UserLastName", user.UserLastName);
                            cmd.Parameters.AddWithValue("@UserName", user.UserName);
                            cmd.Parameters.AddWithValue("@UserPassword", user.UserPassWord);
                            cmd.Parameters.AddWithValue("@UserEmail", user.UserEmail);
                            cmd.Parameters.AddWithValue("@UserTypeID", int.Parse(user.UserType));
                            cmd.Parameters.AddWithValue("@UserRestID", int.Parse(user.UserRestID));
                            cmd.Parameters.AddWithValue("@UserAddress", user.UserAddress);
                            cmd.Parameters.AddWithValue("@UserTel", long.Parse(user.UserTel));
                            cmd.Parameters.AddWithValue("@UserAge", int.Parse(user.UserAge));
                            cmd.Parameters.AddWithValue("@UserJob", user.UserJob);
                            cmd.Parameters.AddWithValue("@UserSchool", user.UserSchool);
                            cmd.ExecuteNonQuery();
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kullanıcı Kaydınız Başarıyla Gerçekleşti Şimdi Giriş Yapabilirsiniz.');</script>");

                            Response.Redirect("Login.aspx");
                        }
                        connection.Close();
                    }
                    catch (Exception ex)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Sayfada" + ex.Message.ToString() + " Hatası Meydana geldi!');</script>");

                    }

                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Kullanıcı Sözleşmesini Onaylamanız Gerekiyor');</script>");
                }
            }


        }

        protected void cbAccept_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}