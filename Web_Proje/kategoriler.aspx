<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kategoriler.aspx.cs" Inherits="Web_Proje.kategoriler" %>

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
        <div style="height: 33px; background-color:#dbb2ed; width: 900px;">&nbsp;&nbsp;<asp:Button ID="btnarti" runat="server" Height="28px" Text="+" Width="30px" OnClick="btnarti_Click" />
&nbsp;&nbsp;
            <asp:Button ID="btneksi" runat="server" Height="30px" Text="-" Width="30px" OnClick="btneksi_Click" />
            &nbsp;&nbsp; Kategori Ekleme Paneli</div>
        <asp:Panel ID="Panel1" runat="server" BackColor="#D5C6CB" Width="900px">
            <table class="auto-style1">
            <tr>
                <td class="auto-style18" style="text-align: right"></td>
                <td class="auto-style5"></td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style18" style="text-align: right">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style9">
                    &nbsp;</td>
            </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">Kategori Adı</td>
                    <td class="auto-style3">:</td>
                    <td class="auto-style10">
                        <asp:TextBox ID="tbadi" runat="server" Height="25px" Width="201px"></asp:TextBox>
                    </td>
                </tr>
            <tr>
                <td class="auto-style4" style="text-align: right">Resmi</td>
                <td class="auto-style5">:</td>
                <td class="auto-style9">
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="25px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7" style="text-align: right"></td>
                <td class="auto-style8"></td>
                <td class="auto-style11">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnekle" runat="server" Font-Bold="False" Height="34px" OnClick="btnekle_Click" Text="Ekle" Width="68px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp; &nbsp;</td>
            </tr>
                <tr>
                    <td class="auto-style2" style="text-align: right">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                </tr>
        </table>
        </asp:Panel>
        <div style="height: 33px"></div>
         <div style="height: 33px; background-color:#dbb2ed; width: 900px;">&nbsp;&nbsp;<asp:Button ID="btnkdarti" runat="server" Height="28px" Text="+" Width="30px" OnClick="btnkdarti_Click" />
&nbsp;&nbsp;
            <asp:Button ID="btnkdeksi" runat="server" Height="30px" Text="-" Width="30px" OnClick="btnkdeksi_Click" />
            &nbsp;&nbsp; Kategori Düzenleme Paneli</div>
        <asp:Panel ID="Panel2" runat="server" BackColor="#D5C6CB" Width="900px">
            <asp:DataList ID="DataList1" runat="server" Width="700px">
                <HeaderTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style12" style="width: 500px">Kategori Adı</td>
                            <td class="auto-style14">Güncelle</td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sil</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style12" style="width: 500px; height: 50px;">
                                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("kategoriad") %>'></asp:Literal>
                            </td>
                            <td class="auto-style14">
                                &nbsp; <a href='kategoriguncelle.aspx?kategoriid=<%# Eval("kategoriid") %>'><img alt="" class="auto-style19" src="tema/düzenle.jpg" /> </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="auto-style15">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <a href="kategoriler.aspx?kategoriid=<%# Eval("kategoriid") %>&islem=sil"><img alt="" class="auto-style20" src="tema/sil.jpg" /></a>  
                                &nbsp;&nbsp;  
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel>
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
