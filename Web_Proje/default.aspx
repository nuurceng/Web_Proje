<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Web_Proje._default" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 35px;
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
     <!-- Navigation --DİNAMİK MENÜ------>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
             
    <div class="container">
      <a class="navbar-brand" href="default.aspx">Anasayfa</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
             <%Response.Write(menutut); %> 
            <link href="menu.css" rel="stylesheet" />
        <%--<ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="default.aspx">Anasayfa
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="hakkında.aspx">Hakkında</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="galeri.aspx">Galeri</a>
          </li>
          <li class="nav-item">
            
          </li>
        </ul>--%>
      </div>
         <a class="nav-link" href="sgaleri.aspx">Galeri</a>
         <a class="nav-link" href="uyegiris.aspx">Giriş Yap</a>
          <a class="nav-link" href="uyeol.aspx">Üye Ol</a>
          <a class="nav-link" href="siteharitasi.aspx">Site Haritası</a>

    </div> 
  </nav>

     

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column---- Makale Detay Kısmı---->
      <div class="col-md-8">

        <h1 class="my-4"><%--Page Heading--%><%Response.Write(tutbaslik); %>
          <small><%--Secondary Text--%></small>
        </h1>

        <!-- Blog Post -->
        <div class="card mb-4">
            <%--<img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">--%>
          <div class="card-body">
            <h2 class="card-title"><%--Post Title--%><%Response.Write(tutozet); %></h2>
            <p class="card-text">
               <%--Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!--%><%Response.Write(tuticerik); %><%Response.Write(tuttarih); %></p>
           <%-- <a href="#" class="btn btn-primary"><%--Read More--%><%--Devamı &rarr;</a>--%>
          </div>
          <div class="card-footer text-muted">
              <%--   Posted on January 1, 2017 by--%>
            <a href="#"><%--Start Bootstrap--%></a>
          </div>
        </div>


             <!-- Blog Post----Kategoriler---->
        <div class="card mb-4">
            
        <%--  <img class="card-img-top" src="http://placehold.it/750x300" img src="kresim/images(4).jpg" />--%><%--alt="Card image cap">--%>
          <div class="card-body">    
            <h4 class="card-title">Kategoriler</h4>
                <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal">
              <ItemTemplate>
                  
                  <a id="a2" href='<%#Eval("kategoriid","~/kategoridetay.aspx?kategoriid={0}") %>' runat="server">
                      <p style="text-align:center"><%#Eval("kategoriad") %> <td> 

                                                                            </td>
                      </p>
                      
                  </a>    
              </ItemTemplate>
                       </asp:DataList>
                        
            <p class="card-text">

                <%--Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!--%></p>
           <%-- <a href="#" class="btn btn-primary">Read More &rarr;</a>--%>
          </div>
          <div class="card-footer text-muted">

            <%--Posted on January 1, 2017 by--%>
            <a href="#"><%--Start Bootstrap--%></a>
          </div>
        </div>

       



           <!-- Blog Post-----Dinamik Menü Detay----->
        <div class="card mb-4">
         <%-- <img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">--%>
          <div class="card-body">
            <h2 class="card-title"><%--Post Title--%><%Response.Write(menuismi); %></h2>
              <%Response.Write(iceriktut); %>
            <p class="card-text"><%--Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!--%> </p>
           <%-- <a href="#" class="btn btn-primary"><--%><%--%--Read More &rarr;</a>--%>
          </div>
          <div class="card-footer text-muted">
            <%--Posted on January 1, 2017 by--%>
            <a href="#"><%--Start Bootstrap--%></a>
          </div>
        </div>


       
        <!-- Pagination -->
        <ul class="pagination justify-content-center mb-4">
          <li class="page-item disabled">
            <a class="page-link" href="default.aspx"><%--&larr;--%><%-- Older--%></a>
          </li>
          <li class="page-item disabled">
            <a class="page-link" href="yonetici.aspx"><%--Newer--%> <%--&rarr;--%></a>
          </li>
        </ul>

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -----Online Kullanıcı----->
        <div class="card my-4">
          
          <div class="card-body">
              <h5 class="card-header"><%--Search--%>Çevrimiçi Ziyaretçi: <asp:Label ID="Label1" runat="server"></asp:Label></h5>
            <div class="input-group">
                
              <%--<input type="text" class="form-control" placeholder="Search for...">--%>
                <%--<asp:TextBox ID="tbara" runat="server" placeholder="Search for"></asp:TextBox>
              <span class="input-group-btn">--%>
            <%--   <button class="btn btn-secondary" type="button">Go!Ara</button>--%>
               <%-- <asp:Button ID="btnara" runat="server" Text="Ara" />
              </span>--%>
            </div>
          </div>
        </div>


          <!-- Side Widget ----Duyurular------->
        <div class="card my-4">
          <h5 class="card-header"><%--Side Widget--%>Duyurular</h5>
          <div class="card-body" style="background-color:black;">
              <%--<asp:Panel ID="Panel1" runat="server" Height="200px" Width="310px">--%>
            <marquee align="middle" scrollamount="2" widtd="100%" direction="up" scrolldelay="10" style="height:160px">
           <asp:Repeater ID="Repeater1" runat="server">
              <ItemTemplate>
                  
                  <a id="a1" href='<%#Eval("duyurularid","~/duyurugoster.aspx?duyurularid={0}") %>' runat="server">
                      <p style="text-align:center"><%#Eval("dbaslik") %> <%#Eval("dtarih") %> </p>
                  </a>    
              </ItemTemplate>
           </asp:Repeater></marquee><!--deneme-->
       <%-- </asp:Panel>--%>

              <%-- You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!--%>
          </div>
        </div>

          <!-- Categories Widget -----Makaleler------>
        <div class="card my-4">
          <h5 class="card-header"><%--Categories--%>Makaleler</h5>
          <div class="card-body" style="background-color:black;">
           <%--   <asp:Panel ID="Panel3" runat="server" Height="200px" Width="310px">--%>
                       <%-- <marquee align="middle" scrollamount="2" widtd="100%" direction="up" scrolldelay="5" style="height:160px" >--%>
                       <asp:DataList ID="DataList2" runat="server" >
              <ItemTemplate>
                  
                  <a id="a3" href='<%#Eval("makaleid","~/default.aspx?makaleid={0}") %>' runat="server">
                      <p style="text-align:center"><%#Eval("baslik") %> <td> 
                         <%-- <asp:Image ID="Image2" runat="server" Height="30px" ImageUrl='<%#Eval("kategoriresim")%>' Width="30px"/>--%>

                                                                            </td>
                      </p>
                      
                  </a>    
              </ItemTemplate>
                       </asp:DataList>
          <%--    </marquee><!--deneme-->--%>
                     <%--   </asp:Panel>--%>
            <div class="row">
              <div class="col-lg-6">
                   
                <ul class="list-unstyled mb-0">
                  
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                 
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- Categories Widget -->
       <%-- <div class="card my-4">
          <h5 class="card-header"><%--Categories--</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
     
                <ul class="list-unstyled mb-0">
                  
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                 
                </ul>
              </div>
            </div>
          </div>
        </div>--%>

        
          
        <!-- Side Widget ----İletişim------>
           <div class="card my-4">
          <h5 class="card-header"><%--Side Widget--%>İletişim</h5>
          <div class="card-body" style="background-color:black;">
               <div style="height:30px; width:100%;float:left; color: #C0C0C0; font-size: small;">Görüşlerinizi buraya yazarak mesaj gönderebilirsiniz.</div>
     <div style="height: 200px">

        <div style="width: 300px; height: 200px; float: left; border: 1px dotted #C7A6D6;margin-left:5px; background-color: #EFEFEF; color: #000000; ">
            Mesajınızı Giriniz:<asp:TextBox ID="tbyorumicerik" runat="server" Height="150px" TextMode="MultiLine" Width="294px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbyorumicerik" ErrorMessage="Mesaj Yazınız!!!" Font-Size="10pt"></asp:RequiredFieldValidator>
        </div>
        <div style="float: right; width: 300px; height: 200px; border: 1px dotted #C7A6D6;margin-right:5px; background-color: #EFEFEF; color: #000000; ">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style1">Ad Soyad</td>
                    <td class="auto-style1">:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="tbadsoyad" runat="server" Height="25px" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbadsoyad" ErrorMessage="Boş Geçemezsiniz" Font-Size="8pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">E-mail</td>
                    <td class="auto-style9">:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="tbemail" runat="server" Height="25px" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbemail" ErrorMessage="Boş Geçemezsiniz" Font-Size="8pt"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="gonder" runat="server"  Height="25px" Text="Gönder" Width="90px" OnClick="gonder_Click" />
                        <asp:Label ID="Label6" runat="server" Font-Size="8pt"></asp:Label>
                    </td>
                </tr>
            </table>

            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbemail" Display="Dynamic" ErrorMessage="Hatalı mail!!!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="10pt"></asp:RegularExpressionValidator>

            <br />
            &nbsp;<asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="10pt" />
            <br />
            <br />
            <br />

        </div>
    
    </div>
       
           <%-- You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!--%>
          </div>
        </div>
      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Nur/Blog Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </form>
</body>
</html>
