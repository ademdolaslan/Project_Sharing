using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Sharing
{
    public partial class AddProject : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ProjectSharingConnection"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {

            if (DDLProjectSubject.SelectedValue == "0" || DDLProjectType.SelectedValue == "0" || tbProjectTitle.Text == "" || tbProjectExplanation.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Lütfen Boş Alan Bırakmayınız.');</script>");
            }
            else
            {
                try
                {
                    SqlCommand cmd_addproject = new SqlCommand();
                    cmd_addproject.Connection = connection;
                    cmd_addproject.CommandText = "INSERT INTO Projects (ProjectTypeID, ProjectSubjectID, ProjectTitle, ProjectExplanation, ProjectViewCount, UserID) VALUES (@ProjectTypeID, @ProjectSubjectID, @ProjectTitle, @ProjectExplanation, @ProjectViewCount, @UserID)";
                    cmd_addproject.Parameters.AddWithValue("@ProjectTypeID", int.Parse(DDLProjectType.SelectedValue.ToString()));
                    cmd_addproject.Parameters.AddWithValue("@ProjectSubjectID", int.Parse(DDLProjectSubject.SelectedValue.ToString()));
                    cmd_addproject.Parameters.AddWithValue("@ProjectTitle", tbProjectTitle.Text);
                    cmd_addproject.Parameters.AddWithValue("@ProjectExplanation", tbProjectExplanation.Text);
                    cmd_addproject.Parameters.AddWithValue("@ProjectViewCount", 0);
                    cmd_addproject.Parameters.AddWithValue("@UserID", int.Parse(Session["UserID"].ToString()));
                    connection.Open();
                    cmd_addproject.ExecuteNonQuery();
                    cmd_addproject.Dispose();
                    connection.Close();
                    connection.Open();
                    SqlCommand cmd_projectid = new SqlCommand();
                    cmd_projectid.Connection = connection;
                    cmd_projectid.CommandText = "select MAX(ProjectID) as ProjectID from Projects";
                    SqlDataReader dr = cmd_projectid.ExecuteReader();
                    int ProjectID = 0;
                    if (dr.Read())
                    {
                        ProjectID = int.Parse(dr["ProjectID"].ToString());
                    }
                    cmd_projectid.Dispose();
                    connection.Close();
                    if (FileUpload1.HasFile)
                    {
                        try
                        {
                            SqlCommand cmd_file = new SqlCommand();
                            string filename = Guid.NewGuid().ToString();
                            FileUpload1.SaveAs(Server.MapPath("~/UserProjectFiles/" + filename));
                            cmd_file.Connection = connection;
                            cmd_file.CommandText = "INSERT INTO Files (ProjectID, FileName, FilePath, FileDownloadCount) VALUES (@ProjectID, @FileName, @FilePath,@FileDownloadCount)";
                            cmd_file.Parameters.AddWithValue("@ProjectID", ProjectID);
                            cmd_file.Parameters.AddWithValue("@FileName", filename);
                            cmd_file.Parameters.AddWithValue("@FilePath", "~/UserProjectFiles/" + filename);
                            cmd_file.Parameters.AddWithValue("@FileDownloadCount", 0);
                            connection.Open();
                            cmd_file.ExecuteNonQuery();
                            cmd_file.Dispose();
                            connection.Close();
                        }
                        catch (Exception ex)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Sayfada " + ex.Message.ToString() + " Hatası Meydana geldi!');</script>");
                        }
                    }
                    Response.Redirect("Projects.aspx");

                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Sayfada" + ex.Message.ToString() + " Hatası Meydana geldi!');</script>");
                }
            }
        }
    }
}
