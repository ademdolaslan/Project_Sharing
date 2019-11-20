<%@ Page EnableEventValidation="true" Title="Projeler" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="Project_Sharing.Projects" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron" style="background-color:white;">

        <table class="nav-justified">
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="250px" ImageUrl="~/Images/bilo.jpg" Width="250px" />
                </td>
                <td>
                    <div class="center">
                        <h1><%: Title %></h1>
                        <p>Projelere Buradan Ulaşabilirsiniz</p>
                        <p class="lead">Eğer bir projenizi bizimle paylaşmak isterseniz projenizi <a runat="server" href="~/AddProject">buradan </a>yükleyebilir ve diğer kullanıcılara iletebilirsiniz</p>
                    </div>
                </td>
            </tr>
        </table>


    </div>



    <div class="row" style="width: 100%">

        <asp:DataList ID="dlProjects" runat="server" Width="100%" CellPadding="4" ForeColor="black" OnItemCommand="dlProjects_ItemCommand">
            <HeaderTemplate>
                <br />
                <table class="nav-justified" style="width: 100%; height: 63px; background-color: gray;">
                    <tr>
                        <td style="width: 4%; text-align: center; font-size: large; color: #808080;">NO</td>
                        <td style="width: 16%; text-align: center; font-size: large;">Proje Sahibinin Adı</td>
                        <td style="width: 16%; text-align: center; font-size: large;">Proje Sahibinin Soyadı</td>
                        <td style="width: 16%; text-align: center; font-size: large; text-align: center;">Proje Türü</td>
                        <td style="width: 16%; text-align: center; font-size: large;">Proje Konusu</td>
                        <td style="width: 17%; text-align: center; font-size: large;">Proje Başlığı</td>
                        <td style="width: 10%; text-align: center; font-size: large;">Görüntülenme Sayısı</td>
                        <td style="width: 5%"></td>
                    </tr>
                </table>
                <br />
            </HeaderTemplate>
            <ItemTemplate>
                <table class="nav-justified" style="width: 100%; height: 63px; background-color: lightgray;">
                    <tr>
                        <td style="width: 4%; text-align: center; font-size: large; text-align: center; color:lightgray;"><%#Eval("ProjectID") %></td>
                        <td style="width: 16%; text-align: center; font-size: large;"><%#Eval("UserFirstName") %> </td>
                        <td style="width: 16%; text-align: center; font-size: large;"><%#Eval("UserLastName") %> </td>
                        <td style="width: 16%; text-align: center; font-size: large;"><%#Eval("ProjectType") %> </td>
                        <td style="width: 16%; text-align: center; font-size: large;"><%#Eval("ProjectSubject") %> </td>
                        <td style="width: 17%; text-align: center; font-size: large;"><%#Eval("ProjectTitle") %> </td>
                        <td style="width: 10%; text-align: center; font-size: large;"><%#Eval("ProjectViewCount") %> </td>
                        <td style="width: 5%">
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="göster" CommandArgument='<%#Eval("ProjectID")+","+Eval("ProjectViewCount")%>' ImageUrl="~/Images/ok.png" Width="50px" Height="50px" />
                        </td>

                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:DataList>


    </div>











</asp:Content>

