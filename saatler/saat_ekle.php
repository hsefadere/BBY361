<?php

require_once("baglanti.php");

$sorgu2 = mysqli_query($baglanti, "SELECT * from firmabilgileri");



?>

<!DOCTYPE html>
<html lang="tr"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>SAATLER</title>

    <!-- Bootstrap core CSS -->
<link href="bootstrap.min.css" rel="stylesheet">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="https://getbootstrap.com/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="https://getbootstrap.com/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="https://getbootstrap.com/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="https://getbootstrap.com/docs/4.4/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="https://getbootstrap.com/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="https://getbootstrap.com/docs/4.4/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="./katalog_files/navbar-top.css" rel="stylesheet">
  </head>
  <body>
  <div
  class="bg-image d-flex justify-content-center align-items-center"
  style="
    background-image: url('https://mdbcdn.b-cdn.net/img/new/fluid/nature/015.jpg');
    height: 35vh;
  "
>
  <h1 class="text-white">Saat Veri Taban??</h1>
</div>
<div class="container">
<div class="row">
  <div class="col-md-12  mt-2">
        <a  href="index.php"><button class="btn btn-primary btn-lg btn-block  pt-2">Ana Sayfa</button></a>
        </div>
        <div class="col-md-12">
        <a  href="saat.php"><button class="btn btn-dark btn-lg btn-block">Saat ????lemleri</button></a>
        </div>
        <div class="col-md-12">
        <a  href=""><button class="btn btn-primary btn-lg btn-block">Firma ????lemleri</button></a>
        </div>
        <div class="col-md-12">
        <a  href=" "><button class="btn btn-dark btn-lg btn-block">Personel ????lemleri</button></a>
        </div>
    </div>
    </div>

<main role="main" class="container">
<!-- KODLAR -->
<h1>Saat Ekle</h1>
<form action="saat_eklendi.php" method="post">
    Saat Markas??: <input type="text" name="UrunMarka"><br><br>
    Saat Ad??: <input type="text" name="UrunAdi"><br><br>
    Fiyat: <input type="text" name="UrunFiyat"><br><br>
    Stok: <input name="UrunStok" rows="2" cols="50"></input><br><br>
    Firma: <select class="" name="FirmaSeriNo">
    <?php  while($satir = mysqli_fetch_assoc($sorgu2)){
        echo"<option value=".$satir['FirmaSeriNo'].">".$satir['FirmaAd??']."</option>";
    }?>

  </select><br>

    <input type="submit" value="Yeni Yazar Ekle">
</form>
<!-- KODLAR -->   
</main>
<script src="jquery-3.4.1.slim.min.js"></script>
      <script src="bootstrap.bundle.min.js"></script>

</body></html>