<%@ Page Title="Giriş Yap" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_Sharing.Login" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="row">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/bilecik.jpg" Width="100%" />
        <br />
        <br />
        <br />
        <div class="col-md-10" style="text-align: center;">
            <asp:Image ID="Image4" runat="server" Height="200px" Width="200px" ImageUrl="~/Images/user-image.png" />
        </div>
        <div class="col-md-10">
            <div class="form-horizontal">
                &nbsp;
                &nbsp;                 
                <div class="form-group" style="margin-left: 200px">
                    <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">Kullanıcı Adı</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="tbUserName" CssClass="form-control" required />
                    </div>
                </div>
                <div class="form-group" style="margin-left: 200px">
                    <asp:Label runat="server" CssClass="col-md-2 control-label" ForeColor="Black">Şifre</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="tbUserPassword" CssClass="form-control" TextMode="Password" required />
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="form-group" style="margin-left: 10px">
                        <div class="col-md-offset-3 col-md-4">
                            <asp:Button runat="server" Text="Oturum Aç" CssClass="btn btn-default" OnClick="Unnamed3_Click" Width="197px" />
                        </div>
                    </div>
                </div>

                <br />
                <p style="color: #000000">Kayıtlı değil misiniz? <a runat="server" href="~/Register">Buradan </a>kayıt olabilirisiniz.</p>
                <br />
            </div>
        </div>
    </div>
</asp:Content>











