using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project_Sharing.Models;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace Project_Sharing
{
    public partial class ViewProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ProjectSharingConnection"].ConnectionString);
                    SqlCommand cmd = new SqlCommand();
                    connection.Open();
                    cmd.Connection = connection;
                    cmd.CommandText = "SELECT * FROM ProjectsInfo WHERE ProjectID=" + ProjectInfo.ProjectID + "";
                    cmd.ExecuteNonQuery();
                    SqlDataReader read = cmd.ExecuteReader();
                    if (read.Read())
                    {
                        Label1.Text = read["UserFirstName"].ToString() + " " + read["UserLastName"].ToString();
                        Label2.Text = read["ProjectSubject"].ToString();
                        Label3.Text = read["ProjectTitle"].ToString();
                        Label4.Text = read["ProjectViewCount"].ToString();
                        TextBox1.Text = read["ProjectExplanation"].ToString();
                    }
                    connection.Close();
                    SqlCommand cmd_getcomments = new SqlCommand();
                    connection.Open();
                    cmd.Connection = connection;
                    cmd.CommandText = "SELECT * FROM view_comments WHERE ProjectID=" + ProjectInfo.ProjectID + "";
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    dtlComment.DataSource = dt;
                    dtlComment.DataBind();
                    connection.Close();
                }

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Sayfada " + ex.Message.ToString() + " Hatası Meydana geldi!');</script>");
            }
        }

        protected void dtlComment_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label lbl = (Label)e.Item.FindControl("lblCommentID");
                    int commentid = int.Parse(lbl.Text);
                    SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ProjectSharingConnection"].ConnectionString);
                    SqlCommand cmd_getsubcomments = new SqlCommand();
                    connection.Open();
                    cmd_getsubcomments.Connection = connection;
                    cmd_getsubcomments.CommandText = "SELECT SubComment FROM SubComment WHERE CommentID=" + commentid + "";
                    DataRowView drv = e.Item.DataItem as DataRowView;
                    DataList dtlSubComment = e.Item.FindControl("dtlSubComment") as DataList;
                    SqlDataAdapter da = new SqlDataAdapter(cmd_getsubcomments);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    dtlSubComment.DataSource = dt;
                    dtlSubComment.DataBind();
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Sayfada " + ex.Message.ToString() + " Hatası Meydana geldi!');</script>");

            }

        }

        protected void dtlComment_ItemCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "altyorum")
                {

                    int CommentID = int.Parse(e.CommandArgument.ToString());
                    TextBox tb = (TextBox)e.Item.FindControl("tbSubComment");
                    if (tb.Text == "")
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Boş Alan Bırakmayın.');</script>");
                    }
                    else
                    {
                        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ProjectSharingConnection"].ConnectionString);
                        SqlCommand cmd_addsubcomments = new SqlCommand();
                        cmd_addsubcomments.Connection = connection;
                        cmd_addsubcomments.CommandText = "INSERT INTO SubComment(CommentID, SubComment) VALUES (@CommentID,@SubComment)";
                        cmd_addsubcomments.Parameters.AddWithValue("@CommentID", CommentID);
                        cmd_addsubcomments.Parameters.AddWithValue("@SubComment", tb.Text.ToString());
                        connection.Open();
                        cmd_addsubcomments.ExecuteNonQuery();
                        connection.Close();
                        Page.Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);
                    }

                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Sayfada " + ex.Message.ToString() + " Hatası Meydana geldi!');</script>");

            }

        }

        protected void btnComment_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserID"] != null)
                {
                    if (tbComment.Text == "" || tbCommentHeader.Text == "")
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Boş Alan Bırakmayın.');</script>");
                    }
                    else
                    {
                        SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ProjectSharingConnection"].ConnectionString);
                        SqlCommand cmd_addcomments = new SqlCommand();
                        cmd_addcomments.Connection = connection;
                        cmd_addcomments.CommandText = "INSERT INTO Comments(UserID, ProjectID, CommentTitle, Comment) VALUES (@UserID,@ProjectID,@CommentTitle,@Comment)";
                        cmd_addcomments.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                        cmd_addcomments.Parameters.AddWithValue("@ProjectID", ProjectInfo.ProjectID.ToString());
                        cmd_addcomments.Parameters.AddWithValue("@CommentTitle", tbCommentHeader.Text.ToString());
                        cmd_addcomments.Parameters.AddWithValue("@Comment", tbComment.Text.ToString());
                        connection.Open();
                        cmd_addcomments.ExecuteNonQuery();
                        connection.Close();
                        Page.Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Yorum Yapabilmek İçin Oturum Açmanız Gerekli.');</script>");
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Sayfada " + ex.Message.ToString() + " Hatası Meydana geldi!');</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string[] info = Label1.Text.Split(' ');
            profile.firstname = info[0];
            profile.lastname = info[1];
            Response.Redirect("ViewProfile.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                try
                {
                    SqlConnection connection = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ProjectSharingConnection"].ConnectionString);
                    connection.Open();
                    SqlCommand cmd_projectid = new SqlCommand();
                    cmd_projectid.Connection = connection;
                    cmd_projectid.CommandText = "select * from files where ProjectID=" + ProjectInfo.ProjectID;
                    SqlDataReader dr = cmd_projectid.ExecuteReader();
                    if (dr.Read())
                    {
                        string filepath = Server.MapPath(dr["FilePath"].ToString());
                        FileInfo file = new FileInfo(filepath);
                        if (file.Exists)
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ClearContent();
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name + ".rar");
                            Response.AddHeader("Content-Length", file.Length.ToString());
                            Response.ContentType = "text/plain";
                            Response.Flush();
                            Response.TransmitFile(file.FullName);
                            Response.End();
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Dosya indirmede Hata Meydana Geldi.');</script>");
                        }
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Proje Dosyası Mevcut Değil.');</script>");
                    }
                    cmd_projectid.Dispose();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Sayfada " + ex.Message.ToString() + " Hatası Meydana geldi!');</script>");

                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Dosyayı İndirebilmek İçin Oturum Açmanız Gerekli.');</script>");
                Response.Redirect("Login.aspx");
            }

        }
    }
}