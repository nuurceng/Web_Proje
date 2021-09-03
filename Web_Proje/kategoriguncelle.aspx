<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kategoriguncelle.aspx.cs" Inherits="Web_Proje.kategoriguncelle" %>

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
            width: 888px;
        }
        .auto-style3 {
            width: 7px;
        }
        .auto-style4 {
            width: 900px;
            height: 31px;
        }
        .auto-style5 {
            width: 7px;
            height: 31px;
        }
        .auto-style6 {
            width: 897px;
            height: 31px;
        }
        .auto-style7 {
            width: 391px;
            height: 31px;
        }
        .auto-style8 {
            width: 391px
        }
        .auto-style9 {
            width: 391px;
            height: 25px;
        }
        .auto-style10 {
            width: 7px;
            height: 25px;
        }
        .auto-style11 {
            width: 900px;
            height: 25px;
        }
    </style>


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
                        <table class="auto-style1" style="background-color: #D5C6CB">
        <tr>
            <td class="auto-style7" style="text-align: right"></td>
            <td class="auto-style3"></td>
            <td class="auto-style6" style="width: 900px"></td>
        </tr>
        <tr>
            <td class="auto-style7" style="text-align: right">Kategori Adı</td>
            <td class="auto-style5">:</td>
            <td class="auto-style4">
                <asp:TextBox ID="tbkad" runat="server" Height="25px" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style8" style="text-align: right">Resmi</td>
            <td class="auto-style3">:</td>
            <td style="width: 900px">
                <asp:FileUpload ID="FileUpload2" runat="server" Height="25px" Width="250px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style9" style="text-align: right"></td>
            <td class="auto-style10"></td>
            <td class="auto-style11">
                <asp:Button ID="btnguncelle" runat="server" Height="25px" Text="Güncelle" Width="90px" OnClick="btnguncelle_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style8" style="text-align: right">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td style="width: 900px">&nbsp;</td>
        </tr>
    </table>
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
