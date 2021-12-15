<?php
    /* Bağlantı bilgilerinin alınması*/
    require_once("baglanti.php");

    /* Ekleme işlemi sorgusu */
    $SaatSeriNo = mysqli_real_escape_string($baglanti, $_POST['SaatSeriNo']);    
    $UrunMarka = mysqli_real_escape_string($baglanti, $_POST['UrunMarka']);
    $UrunAdi = mysqli_real_escape_string($baglanti, $_POST['UrunAdi']);
    $UrunFiyat = mysqli_real_escape_string($baglanti, $_POST['UrunFiyat']);
   
    $sorgu = "UPDATE saat SET UrunMarka = '$UrunMarka', UrunAdi = '$UrunAdi', 
    UrunFiyat = '$UrunFiyat'
     WHERE SaatSeriNo = $SaatSeriNo";

    if (mysqli_query($baglanti, $sorgu)) {
        $islemSonuc = "Kayıt Başarıyla güncellendi.";
    } else {
        $islemSonuc = "Hata: " . $sorgu . "<br>" . mysqli_error($baglanti);
    }

    $sorgu2 = mysqli_query($baglanti, "SELECT s.SaatSeriNo,s.UrunAdi,s.UrunMarka,s.UrunFiyat,s.UrunStok,f.FirmaAdı
     FROM saat s,firmabilgileri f
     where s.FirmaIdNo=f.FirmaSeriNo");

    mysqli_close($baglanti);

?>


<!DOCTYPE html>
<html lang="tr"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Saat</title>

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

<body>
<div
  class="bg-image d-flex justify-content-center align-items-center"
  style="
    background-image: url('https://mdbcdn.b-cdn.net/img/new/fluid/nature/015.jpg');
    height: 35vh;
  "
>
  <h1 class="text-white">Ürün Güncelleme</h1>
</div>
<div class="container">
<div class="row">
  <div class="col-md-12  mt-2">
        <a  href="index.php"><button class="btn btn-primary btn-lg btn-block  pt-2">Ana Sayfa</button></a>
        </div>
        <div class="col-md-12">
        <a  href="saat.php"><button class="btn btn-dark btn-lg btn-block">Saat İşlemleri</button></a>
        </div>
        <div class="col-md-12">
        <a  href=""><button class="btn btn-primary btn-lg btn-block">Firma İşlemleri</button></a>
        </div>
        <div class="col-md-12">
        <a  href=" "><button class="btn btn-dark btn-lg btn-block">Personel İşlemleri</button></a>
        </div>
    </div>
    </div>

    <main role="main" class="container">
<h1>Ürün İşlem Sonucu</h1>
<p><?php echo $islemSonuc; ?></p>
<?php
echo("<table border=1 width=80%>");
    echo("<tr>");
    echo("<td><b>Saat Seri No</b></td>");
    echo("<td><b>Ürün Marka</b></td>");
    echo("<td><b>Ürün Adı</b></td>");
    echo("<td><b>Ürün Fiyat</b></td>");
    echo("<td><b>Ürün Stok</b></td>");
    echo("<td><b>Firma Adı</b></td>");
    echo("<td><b>Güncelle</b></td>");
    echo("<td><b>Sil</b></td>");
    echo("</tr>");
/* Sorgu sonuçlarının yazdırılması */
while($satir = mysqli_fetch_assoc($sorgu2)){
    echo("<tr>");
    echo("<td>".$satir["SaatSeriNo"]."</td>");
    echo("<td>".$satir["UrunMarka"]."</td>");
    echo("<td>".$satir["UrunAdi"]."</td>");
    echo("<td>".$satir["UrunFiyat"]."</td>");
    echo("<td>".$satir["UrunStok"]."</td>");
    echo("<td>".$satir["FirmaAdı"]."</td>");
    echo("<td><a href='guncel.php?SaatSeriNo=".$satir["SaatSeriNo"]."'>Güncelle</a></td>");
    echo("<td><a href='sil.php?SaatSeriNo=".$satir["SaatSeriNo"]."'>Sil</a></td>");
    echo("</tr>");
            }
echo("</table>");
?>