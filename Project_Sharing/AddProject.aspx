<%@ Page Title="Proje Ekle" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="Project_Sharing.AddProject" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div style="background-color: white; height: 400px;">

        <table class="nav-justified">
            <tr>
                <td style="text-align: center">
                    <asp:Image ID="Image1" runat="server" Height="250px" ImageUrl="~/Images/bilo.jpg" Width="250px" />
                </td>
                <td>
                    <div class="center">
                        <h1><%: Title %></h1>
                        <p class="lead">Projenizi Buradan Paylaşabilirsiniz</p>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="row" style="width: 100%; height: auto;">
        <table class="nav-justified" style="width: 100%;">
            <tr>
                <td style="width: 25%; height: 69px;" class="nav-justified">

                    <asp:Label runat="server" CssClass="control-label" ForeColor="Black">Proje Türü</asp:Label>
                    &nbsp;               
                        <asp:DropDownList ID="DDLProjectType" runat="server" CssClass="form-control" Width="280px">
                            <asp:ListItem Value="0">Seçiniz...</asp:ListItem>
                            <asp:ListItem Value="1">Mühendislik Tasarım Çalışması I</asp:ListItem>
                            <asp:ListItem Value="2">Mühendislik Tasarım Çalışması II</asp:ListItem>
                            <asp:ListItem Value="3">Bitirme Çalışması</asp:ListItem>
                            <asp:ListItem Value="4">Yüksek Lisans Tezi</asp:ListItem>
                            <asp:ListItem Value="5">Doktora Tezi</asp:ListItem>
                            <asp:ListItem Value="6">Ders Projesi</asp:ListItem>
                            <asp:ListItem Value="7">Kişisel Tasarım Çalışması</asp:ListItem>
                            <asp:ListItem Value="8">Diğer</asp:ListItem>
                        </asp:DropDownList>


                </td>
                <td style="width: 25%; height: 69px;">
                    <asp:Label runat="server" CssClass="control-label" ID="Label1" ForeColor="Black">Proje Konusu</asp:Label>
                    &nbsp;                     
                        <asp:DropDownList ID="DDLProjectSubject" runat="server" CssClass="form-control" Width="280px">
                            <asp:ListItem Value="0">Seçiniz...</asp:ListItem>
                            <asp:ListItem Value="1">Gömülü Sistemler</asp:ListItem>
                            <asp:ListItem Value="2">Arttırılmış Gerçeklik</asp:ListItem>
                            <asp:ListItem Value="3">Yapay Zeka</asp:ListItem>
                            <asp:ListItem Value="4">Bulanık Mantık</asp:ListItem>
                            <asp:ListItem Value="5">Ağ Güvenliği</asp:ListItem>
                            <asp:ListItem Value="6">Kriptoloji</asp:ListItem>
                            <asp:ListItem Value="7">Bilgisayar Ağları</asp:ListItem>
                            <asp:ListItem Value="8">Oyun Programlama</asp:ListItem>
                            <asp:ListItem Value="9">Simülasyon</asp:ListItem>
                            <asp:ListItem Value="10">Hibrit Proje</asp:ListItem>
                            <asp:ListItem Value="11">Web Otomasyon</asp:ListItem>
                            <asp:ListItem Value="12">Mobil Otomasyon</asp:ListItem>
                            <asp:ListItem Value="13">Masaüstü Otomasyon</asp:ListItem>
                            <asp:ListItem Value="14">Nesnelerin İnterneti</asp:ListItem>
                            <asp:ListItem Value="15">Diğer</asp:ListItem>
                        </asp:DropDownList>
                </td>
                <td style="width: 25%; height: 69px;">
                    <asp:Label runat="server" CssClass="control-label" ID="Label2" ForeColor="Black">Proje Başlığı</asp:Label>
                    &nbsp;                 
                        <asp:TextBox Width="300px" runat="server" ID="tbProjectTitle" CssClass="form-control" />
                </td>
                <td style="width: 25%; height: 69px;"></td>

            </tr>
            <tr>
                <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Label runat="server" CssClass="control-label" ID="Label3" ForeColor="Black">Proje Açıklaması</asp:Label>
                    &nbsp;                 
                    <asp:TextBox Width="100%" Height="200px" runat="server" ID="tbProjectExplanation" CssClass="form-control" TextMode="MultiLine" />
                </td>

            </tr>

            <tr>
                <td colspan="4">&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Lütfen dosyanızın tamamını .rar dosyası halinde tek bir dosya haline getiriniz." ForeColor="Black"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                </td>
                <td></td>
                <td></td>
            </tr>


            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <asp:Button Width="100%" ID="btnsave" runat="server" Text="Projeyi Paylaş" CssClass="btn btn-default" ClientIDMode="Static" OnClick="btnsave_Click" />
                </td>
            </tr>


        </table>



    </div>












</asp:Content>
