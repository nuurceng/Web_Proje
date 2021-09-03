<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="Web_Proje.menu" ValidateRequest="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simple Sidebar - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/simple-sidebar.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


    
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 86px;
        }
        .auto-style3 {
            width: 17px;
        }
        .auto-style4 {
            width: 86px;
            height: 23px;
        }
        .auto-style5 {
            width: 17px;
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            width: 86px;
            height: 20px;
        }
        .auto-style8 {
            width: 17px;
            height: 20px;
        }
        .auto-style9 {
            height: 20px;
        }
        .auto-style10 {
            width: 86px;
            height: 31px;
        }
        .auto-style11 {
            width: 17px;
            height: 31px;
        }
        .auto-style12 {
            height: 31px;
        }
    </style>

     <script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            var editor = CKEDITOR.replace('<%=icerik.ClientID%>');
            CKFinder.setupCKEditor(editor, '../ckfinder');


        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
         <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">
                        <%--Start Bootstrap--%>Yönetici Paneli
                    </a>
                </li>
                <li>
                    <a href="duyurular.aspx"><%--Dashboard--%>Duyurular</a>
                </li>
                <li>
                    <a href="kategoriler.aspx"><%--Shortcuts--%>Kategoriler</a>
                </li>
                <li>
                    <a href="makaleler.aspx"><%--Overview--%>Makaleler</a>
                </li>
                <li>
                    <a href="mesajlar.aspx"><%--Events--%>Mesajlar</a>
                </li>
                <li>
                    <a href="uyeler.aspx"><%--About--%>Üyeler</a>
                </li>
                <li>
                    <a href="menu.aspx"><%--Services--%>Dinamik Menü</a>
                </li>
                <li>
                    <a href="uyeyeozel.aspx"><%--Services--%>Üyeye Özel</a>
                </li>
                <li>
                    <a href="ziyaretciler.aspx"><%--Services--%>Ziyaretçiler(IP)</a>
                </li>
                <li>
                    <a href="yoneticigiris.aspx"><%--Services--%>Çıkış</a>
                </li>
                <%--<li>
                    <a href="#">Contact</a>
                </li>--%>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div style="height: 33px; background-color:#dbb2ed; width: 900px;">&nbsp;&nbsp;<asp:Button ID="btnarti" runat="server" Height="28px" Text="+" Width="30px" OnClick="btnarti_Click"  />
&nbsp;&nbsp;
            <asp:Button ID="btneksi" runat="server" Height="30px"  Text="-" Width="30px" OnClick="btneksi_Click"  />
            &nbsp;&nbsp;Dinamik Menü Paneli</div>
                          <asp:Panel ID="Panel1" runat="server" BackColor="#D5C6CB" Width="900px">
                          <table class="auto-style1" style="background-color: #D5C6CB; width: 900px">
                              <tr>
                <td class="auto-style2"></td>
                <td class="auto-style3"></td>
                <td style="margin-left: 40px">
                </td>
            </tr>
                              <tr>
                <td class="auto-style7"></td>
                <td class="auto-style8"></td>
                <td style="margin-left: 40px" class="auto-style9">
                </td>
            </tr>
            <tr>
                <td class="auto-style10" style="text-align: right">Sayfa Adı</td>
                <td class="auto-style11">:</td>
                <td style="margin-left: 40px" class="auto-style12">
                    <asp:TextBox ID="ad" runat="server" Height="25px" Width="151px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align: right">Id</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="id" runat="server" Height="25px" Width="151px"></asp:TextBox>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align: right">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="ekle" runat="server" OnClick="ekle_Click" Text="Ekle" />
                    &nbsp;&nbsp;
                    <asp:Button ID="sil" runat="server" OnClick="sil_Click" Text="Sil" Width="34px" />
                    &nbsp;&nbsp;
                    <asp:Button ID="duzelt" runat="server" OnClick="duzelt_Click" Text="Düzelt" />
                    &nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align: right">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align: right">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" GridLines="Vertical" Height="182px" Width="251px">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="id" HeaderText="Sayfa ID" />
                            <asp:BoundField DataField="ad" HeaderText="Sayfa Adı" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align: right">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" style="text-align: right">Sayfa İçeriği</td>
                <td class="auto-style5">:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="icerik" runat="server" TextMode="MultiLine" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="kaydet" runat="server" OnClick="kaydet_Click" Text="Kaydet" Height="30px" />
                </td>
            </tr>
                              <tr>
                <td class="auto-style2"></td>
                <td class="auto-style3"></td>
                <td style="margin-left: 40px">
                </td>
            </tr>
                              <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td style="margin-left: 40px">
                    &nbsp;</td>
            </tr>
        </table>
                              </asp:Panel>

       <div>
           <br />
           <br />
                        </div>
                        <h1><%--Simple Sidebar--%></h1>

                       <%-- <p>This template has a responsive menu toggling system. The menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will appear/disappear. On small screens, the page content will be pushed off canvas.</p>
                        <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>.</p>--%>
                        <a href="#menu-toggle" class="btn btn-default" id="menu-toggle"><%--Toggle Menu--%>Göster/Gizle</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>
    
    </form>
</body>
</html>
