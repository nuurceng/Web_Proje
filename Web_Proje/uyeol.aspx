<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uyeol.aspx.cs" Inherits="Web_Proje.uyegiris" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <style type="text/css">
          .auto-style1 {
              height: 33px;
          }
      </style>
      /*!
 * Start Bootstrap - Blog Home (https://startbootstrap.com/template-overviews/blog-home)
 * Copyright 2013-2019 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap-blog-home/blob/master/LICENSE)
 */
body {
  padding-top: 56px;
}
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Blog Home - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">

</head>
<body>
    <form id="form1" runat="server">
     <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Üye Ol</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
          <%--<ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="default.aspx"><%Home%>
             
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="hakkında.aspx"><%--About--Hakkında</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="galeri.aspx"><%--Services--Galeri</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="uyegiris.aspx"><%--Contact--Üye Ol</a>
          </li>
        </ul>--%> 
          <span class="sr-only">(current)</span>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <h1 class="my-4"><%--Page Heading--%>
          <small><%--Secondary Text--%></small>
        </h1>

        <!-- Blog Post -->
        <div class="card mb-4">
            <%--<img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">--%>
          <div class="card-body" style="background-color:#EFEFEF">
    
        <table class="auto-style1" style="color: #0000FF">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Adı ve Soyadı</td>
                <td class="auto-style1">:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="adsoyad" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="adsoyad" ErrorMessage="Boş Geçemezsiniz."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">E-Posta</td>
                <td class="auto-style8">:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="eposta" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="eposta" Display="Dynamic" ErrorMessage="Boş Geçemezsiniz."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Kullanıcı Adı</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="ka" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Şifre</td>
                <td class="auto-style5">:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="sf" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="sf" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Şifre Doğrula</td>
                <td class="auto-style8">:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="sfd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="sfd" ErrorMessage="*"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="sf" ControlToValidate="sfd" Display="Dynamic" ErrorMessage="Şifreler uyuşmuyor"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Yaş</td>
                <td class="auto-style8">:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="yas" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="yas" ErrorMessage="18-80 arası yaş girin" MaximumValue="80" MinimumValue="18" Type="Integer"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7"></td>
                <td class="auto-style8"></td>
                <td class="auto-style9">
                    <asp:Button ID="kaydol" runat="server" Text="Kaydol" OnClick="kaydol_Click" ForeColor="#0000CC" />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="eposta" Display="Dynamic" ErrorMessage="Hatalı Mail !" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ViewStateMode="Enabled"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
   
            <h2 class="card-title"><%--Post Title--%></h2>
            <p class="card-text"><%--Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!--%></p>
         <a href="uyegiris.aspx" class="btn btn-primary">Giriş Yapınız&rarr; </a>
          </div>
          <div class="card-footer text-muted">
              <%--   Posted on January 1, 2017 by--%>
            <a href="#"><%--Start Bootstrap--%></a>
          </div>
        </div>

     

        <!-- Pagination -->
        <ul class="pagination justify-content-center mb-4">
          <li class="page-item disabled">
            <a class="page-link" href="#"><%--&larr;--%><%-- Older--%><%--Büyük--%></a>
          </li>
          <li class="page-item disabled">
            <a class="page-link" href="#"><%--Newer--%><%--Daha Yeni &rarr;--%></a>
          </li>
        </ul>

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

       

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </form>
</body>
</html>
