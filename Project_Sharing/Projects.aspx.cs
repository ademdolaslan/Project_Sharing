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
    public partial class Projects : System.Web.UI.Page
    {

        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ProjectSharingConnection"].ConnectionString);
        
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataAdapter adptr = new SqlDataAdapter("Select * From ProjectsInfo", connection);
                DataTable dt = new DataTable("Select * From ProjectsInfo");
                adptr.Fill(dt);
                dlProjects.DataSource = dt;
                dlProjects.DataBind();
            }          
        }

        protected void dlProjects_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName=="göster")
            {
                string[] arg = e.CommandArgument.ToString().Split(new char[] { ',' });
                ProjectInfo.ProjectID = int.Parse(arg[0]);
                ProjectInfo.viewcount = int.Parse(arg[1]);
                int cnt = ProjectInfo.viewcount + 1;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "UPDATE Projects SET ProjectViewCount=" + cnt + " WHERE ProjectID=" + ProjectInfo.ProjectID + "";
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
                Response.Redirect("ViewProject.aspx");
            }
        }
    }
}