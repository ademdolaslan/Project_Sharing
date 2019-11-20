<%@ Page Title="ANA SAYFA" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project_Sharing._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">





    <div class="jumbotron">
        <div class="center">
            <h1>Bilecik Şeyh Edebali Üniversitesi Proje Paylaşım Platformu</h1>
        <p class="lead">Bilecik Şeyh Edebali Üniversitesi proje paylaşım platformuna hoş geldiniz. Bir hesabınız var ise <a runat="server" href="~/Login"> buradan </a> giriş yapabilir, eğer bir hesabınız yok ise <a runat="server" href="~/Register"> buradan </a> hesap oluşturabilirsiniz.</p>
        <p><a href="http://bilecik.edu.tr/" class="btn btn-primary btn-lg">Bilecik Şeyh Edebali Üniversitesi Web Sayfası &raquo;</a></p>
    
        </div>
   </div>
    <br /><br /><br />
    <div class="row">
        <div class="col-md-4">
            <asp:Image ID="Image1" runat="server" Height="250px" ImageUrl="~/Images/proje2.png" Width="250px" />
            <h2 style="color: #000000">Birden Çok Proje</h2>
            
            <p style="color: #000000">
                İnsanların birbiriyle paylaştıkları projeler ile aradığınız proje ve bilgiye doğrudan ulaşım sağlayabilirsiniz
            </p>
            <p>
                
            </p>
        </div>
        <div class="col-md-4">
            <asp:Image ID="Image2" runat="server" Height="250px" ImageUrl="~/Images/connect.png" Width="250px" />
            <h2 style="color: #000000">Kullanıcılar ile anlık iletişim</h2>
            
            <p style="color: #000000">
                Paylaşılan proje altında yapacağınız yorumlar ile proje sahibiyle veya yorum sahibiyle iletişim kurun.
            </p>
            <p>
                
            </p>
        </div>
        <div class="col-md-4">
            <asp:Image ID="Image3" runat="server" Height="250px" ImageUrl="~/Images/dosya.png" Width="250px" />
            <h2 style="color: #000000">Dosya Paylaşımı</h2>
            
            <p style="color: #000000">
                İsterseniz projenizin dosyalarını diğer kullanıcılarla paylaşın veya kullanıcıların paylaşmış olduğu dosyalara erişim sağlayıp ayrıntılı bilgi alın
            </p>
            <p>
                
            </p>
        </div>

    </div>

</asp:Content>
