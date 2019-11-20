<%@ Page Title="Proje Görüntüle" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProject.aspx.cs" Inherits="Project_Sharing.ViewProject" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />

    <div class="row" style="height: 452px; width: 100%; background-color: lightgrey;">
        <table class="nav-justified">
            <tr>
                <td style="margin: inherit; text-align: center;">&nbsp;Proje Sahibi:<br />
                    &nbsp; 
                    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
                </td>
                <td style="width: 33%; height: 107px; text-align: center;">
                    <asp:Button ID="Button2" CssClass="btn btn-default" runat="server" Text="Dosyayı İndir" Width="243px" OnClick="Button2_Click"  Height="53px" />&nbsp;&nbsp;
                </td>
                <td style="width: 34%; text-align: right; height: 107px;">
                    <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" Text="Profili Görüntüle" Width="187px" OnClick="Button1_Click" OnClientClick="document.forms[0].target='_blank';" />&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td style="margin: inherit; text-align: center;">&nbsp; Proje Konusu:<br />
                    &nbsp;
                    <asp:Label ID="Label2" runat="server" Text="Label" Font-Size="X-Large"></asp:Label>
                </td>
                <td colspan="2" rowspan="3" style="width: 67%">&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" Height="330px" ReadOnly="True" TextMode="MultiLine" Width="98%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="margin: inherit; text-align: center;">&nbsp;Proje Başlığı:<br />
                    &nbsp; 
                    <asp:Label ID="Label3" runat="server" Text="Label" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="margin: inherit; text-align: center;">&nbsp;Görüntülenme Sayısı:<br />
                    &nbsp;
                    <asp:Label ID="Label4" runat="server" Text="Label" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="row" style="height: auto; width: 100%; background-color: lightgrey;">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:DataList ID="dtlComment" runat="server" Width="100%" OnItemDataBound="dtlComment_ItemDataBound" OnItemCommand="dtlComment_ItemCommand">
                    <ItemTemplate>
                        <div class="row" style="height: auto; width: 96%; background-color: white; margin-left: 25px; margin-top: 25px; margin-right: 25px; margin-bottom: 25px;">
                            <table style="width: 96%; margin-left: 10px; margin-right: 10px;">
                                <tr style="margin-left: 10px; margin-right: 10px;">
                                    <asp:Label ID="lblCommentID" runat="server" ForeColor="White" Text='<%# Eval("CommentID") %>'></asp:Label>
                                    <td style="font-size: x-large; width: 100%; height: 45px;">&nbsp;&nbsp;&nbsp;Yorum Sahibi:&nbsp;<%# Eval("UserFirstName") %>&nbsp; <%#Eval("UserLastName") %></td>
                                </tr>
                                <tr style="margin-left: 10px; margin-right: 25px;">
                                    <td style="font-size: large; width: 100%; height: 45px;">&nbsp;&nbsp;&nbsp;<%# Eval("CommentTitle") %></td>
                                </tr>
                                <tr style="margin-left: 10px; margin-right: 25px;">
                                    <td style="width: 100%; margin-left: 10px; margin-right: 15px; height: auto;">&nbsp;&nbsp;&nbsp;<%#Eval("Comment") %></td>
                                </tr>

                            </table>
                            <br />
                        </div>
                        <div class="row" style="height: auto; width: 80%; background-color: white; margin-left: 150px; margin-top: 25px; margin-right: 25px; margin-bottom: 25px;">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:DataList ID="dtlSubComment" runat="server">
                                        <ItemTemplate>
                                            <div style="margin-top: 10px;">
                                                <table style="width: 96%; margin-left: 10px; margin-right: 10px;">
                                                    <tr style="margin-left: 10px; margin-right: 25px;">
                                                        <td style="width: 100%; margin-left: 10px; margin-right: 15px; height: auto;">&nbsp;&nbsp;&nbsp;
                                                    <%#Eval("SubComment") %>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <hr />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <table style="width: 97%; height: 152px; margin-left: 15px; margin-right: 15px;">
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="tbSubComment" runat="server" Height="50px" TextMode="MultiLine" Width="98%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnSubComment" CssClass="btn btn-default" runat="server" Text="Yorumu Gönder" Width="187px" CommandName="altyorum" CommandArgument='<%# Eval("CommentID") %>' />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnSubComment" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <hr />
                <hr />
                <table style="width: 97%; height: 152px; margin-left: 15px; margin-right: 15px;">
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Yorum Başlığı"></asp:Label>
                            <asp:TextBox ID="tbCommentHeader" runat="server" CssClass="form-control" Width="45%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 95%; height: 86px;">
                            <asp:TextBox ID="tbComment" runat="server" Height="100px" TextMode="MultiLine" Width="98%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="margin-right: 25px;">
                        <td style="width: 85%; height: 77px; text-align: right; margin-right: 25px;">
                            <asp:Button ID="btnComment" CssClass="btn btn-default" runat="server" Text="Yorumu Gönder" Width="187px" OnClick="btnComment_Click" />&nbsp;&nbsp;</td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnComment" EventName="Click" />

            </Triggers>
        </asp:UpdatePanel>






    </div>

</asp:Content>
