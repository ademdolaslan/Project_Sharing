<%@ Page Title="Profil" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Project_Sharing.Profile" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">




    <div class="jumbotron">
        <div class="center">

            <h1>
                <asp:Label ID="caption" runat="server" Text="başlık"></asp:Label>
            </h1>
        </div>
    </div>
    <hr />
    <div class="center">
        <div class="row">
            <div class="col-md-4">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/personal.png" Width="250px" Height="250px" />
                <h2 style="color: #000000">Kişisel Bilgiler</h2>
                <p>
                    <asp:Label ID="Label2" runat="server" Text="İsim: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="label_firsname" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label1" runat="server" Text="Soyisim: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="label_lastname" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label3" runat="server" Text="Nitelik: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="label_type" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label9" runat="server" Text="Yaş: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="label_age" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label5" runat="server" Text="Mesleği: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="label_job" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label7" runat="server" Text="Eğitim: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="label_school" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                </p>


            </div>
            <div class="col-md-4">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/contact.png" Width="250px" Height="250px" />
                <h2 style="color: #000000">İletişim Bilgileri</h2>
                <p>
                    <asp:Label ID="Label11" runat="server" Text="Email: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="label_email" runat="server" Text="Label" ForeColor="Black"></asp:Label>

                </p>
                <p>
                    <asp:Label ID="Label13" runat="server" Text="Adres: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="label_address" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label15" runat="server" Text="Telefon: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="label_tel" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                </p>
            </div>

            <div class="col-md-4">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/reg.png" Width="250px" Height="250px" />
                <h2 style="color: #000000">Kayıt Bilgileri</h2>
                <p>
                    <asp:Label ID="Label17" runat="server" Text="Kayıt Tarihi: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="label_logdate" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                </p>
                <p>
                    <asp:Label ID="Label19" runat="server" Text="Kayıt Durumu: " ForeColor="Black"></asp:Label>
                    <asp:Label ID="label_resttype" runat="server" Text="Label" ForeColor="Black"></asp:Label>
                </p>
            </div>
        </div>
    </div>
    <hr />
    <div style="float: right">




        <asp:Button UseSubmitBehavior="false" class="btn btn-primary btn-lg" ID="btn_logout" runat="server" Text="Oturumu Kapat" OnClick="btn_logout_Click" />

    </div>





</asp:Content>
