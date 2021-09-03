<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sgaleri.aspx.cs" Inherits="Web_Proje.sgaleri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

    <!-- Insert to your webpage before the </head> -->
    <script src="sliderjs/jquery.js"></script>
    <script src="sliderjs/amazingslider.js"></script>
    <link rel="stylesheet" type="text/css" href="sliderjs/amazingslider-1.css">
    <script src="sliderjs/initslider-1.js"></script>
    <!-- End of head section HTML codes -->

</head>
<body>
    <form id="form1" runat="server">

         <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Galeri</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
     
          <span class="sr-only">(current)</span>
      </div>
    </div>
  </nav>
<br />
<br />
<br />
        <br />
        <br />

  <div>
    <!-- Insert to your webpage where you want to display the slider -->
    <div class="amazingslider-wrapper" id="amazingslider-wrapper-1" style="display:block;position:relative;max-width:550px;margin:0px auto 56px;">
        <div class="amazingslider" id="amazingslider-1" style="display:block;position:relative;margin:0 auto;">
            <ul class="amazingslider-slides" style="display:none;">
              
                <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                          <li>
                              <img src='<%# "kresim/" + Eval("kategoriresim") %>' alt="<%#Eval("kategoriad") %>" title="" />
                          </li>
                    </ItemTemplate>
                </asp:DataList>
               
            </ul>
            <ul class="amazingslider-thumbnails" style="display:none;">
              
            </ul>
        <div class="amazingslider-engine"><a href="http://amazingslider.com" title="jQuery Slider"></a></div>
        </div>
    </div>
    <!-- End of body section HTML codes -->
</div>
    </form>
</body>
</html>
