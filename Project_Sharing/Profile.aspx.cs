using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Sharing
{
    public partial class Profile : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                label_firsname.Text = Session["UserFirstName"].ToString();
                label_lastname.Text = Session["UserLastName"].ToString();
                label_email.Text = Session["UserEmail"].ToString();
                label_type.Text = Session["UserType"].ToString();
                label_resttype.Text = Session["UserRestType"].ToString();
                label_address.Text = Session["UserAddress"].ToString();
                label_tel.Text = Session["UserTel"].ToString();
                label_age.Text = Session["UserAge"].ToString();
                label_job.Text = Session["UserJob"].ToString();
                label_school.Text = Session["UserSchool"].ToString();
                label_logdate.Text = DateTime.Parse(Session["UserLogDate"].ToString()).Date.ToShortDateString();
                caption.Text = Session["UserFirstName"].ToString() + " " + Session["UserLastName"].ToString();                
            }
            catch (Exception ex)
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Oturum Açmanız Gerekli');</script>");
                
                Response.Redirect("Login.aspx");
            }
            

        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Oturum Kapatıldı.');</script>");
            Response.Redirect("Login.aspx");
        }
    }
}