-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 14 Ara 2021, 12:53:04
-- Sunucu sürümü: 10.4.21-MariaDB
-- PHP Sürümü: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `saatbilgileri`
--
CREATE DATABASE IF NOT EXISTS `saatler` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `saatler`;
-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `firmabilgileri`
--

CREATE TABLE `firmabilgileri` (
  `FirmaKayitTarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Kayıt Tarihi ve Saati',
  `FirmaSeriNo` int(11) NOT NULL COMMENT 'Otomatik Artan Firma No',
  `FirmaIdNo` int(20) NOT NULL COMMENT 'Firma ID Numarası',
  `FirmaAdı` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Firma Adı',
  `FirmaAdresi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Firma Adresi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `firmabilgileri`
--

INSERT INTO `firmabilgileri` (`FirmaKayitTarihi`, `FirmaSeriNo`, `FirmaIdNo`, `FirmaAdı`, `FirmaAdresi`) VALUES
('2021-11-09 20:49:10', 1, 1, 'Yeni Saat Firması', 'Çayyolu'),
('2021-11-09 22:47:15', 2, 2, 'Watch & Watch', 'Şafaktepe mh. 240. Sk No:24/8');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personelbilgileri`
--

CREATE TABLE `personelbilgileri` (
  `PersKayitTarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Kayıt Tarihi ve Saati',
  `PersSeriNo` int(11) NOT NULL COMMENT 'Otomatik Artan Personel No',
  `PersAdi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Personel Adı',
  `PersSoyadi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Personel Soyad',
  `PersTel` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Personel Telefon No',
  `PersMail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kullaniciadi@alanadi.com' COMMENT 'Personel Mail',
  `PersAdres` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Personel Adresi',
  `FirmaIdNo` int(20) NOT NULL COMMENT 'Çalıştığı Firma ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `personelbilgileri`
--

INSERT INTO `personelbilgileri` (`PersKayitTarihi`, `PersSeriNo`, `PersAdi`, `PersSoyadi`, `PersTel`, `PersMail`, `PersAdres`, `FirmaIdNo`) VALUES
('2021-11-09 22:50:03', 2, 'Harun Sefa', 'Dere', '5535554505', 'hsefadere0@gmail.com', 'Durali alıç mah. 927.sk no:5/1 Mamak/ANKARA', 1),
('2021-11-09 22:46:04', 3, 'Ali', 'Kaya', '5545328697', 'alikaya@gmail.com', 'Şafaktepe mah. 852 sk. No:4/4', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `saat`
--

CREATE TABLE `saat` (
  `SaatKayıtTarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Kayıt Tarihi ve Saati',
  `SaatSeriNo` int(11) NOT NULL COMMENT 'Otomatik Artan Ürün No',
  `FirmaIdNo` int(20) NOT NULL COMMENT 'Firma Bilgileri',
  `UrunMarka` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ürün Markası',
  `UrunAdi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ürün Adı ',
  `UrunStokId` int(20) NOT NULL COMMENT 'Ürün Stok Bilgisi',
  `UrunFiyat` int(11) NOT NULL COMMENT 'Ürün Fiyatı'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `saat`
--

INSERT INTO `saat` (`SaatKayıtTarihi`, `SaatSeriNo`, `FirmaIdNo`, `UrunMarka`, `UrunAdi`, `UrunStokId`, `UrunFiyat`) VALUES
('2021-11-09 20:11:16', 1, 0, 'Apple', 'Watch 7', 0, 4500),
('2021-11-09 21:32:25', 13, 2, 'Swatch', 'Watch2', 1, 3100),
('2021-11-09 22:43:12', 14, 3, 'Slazenger', 'SLwatch', 2, 800);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `stokbilgisi`
--

CREATE TABLE `stokbilgisi` (
  `StokKayitTarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Kayıt Tarihi ve Saati',
  `UrunStokId` int(20) NOT NULL COMMENT 'Ürün Stok No',
  `StokAdet` int(20) NOT NULL COMMENT 'Ürün Adedi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `stokbilgisi`
--

INSERT INTO `stokbilgisi` (`StokKayitTarihi`, `UrunStokId`, `StokAdet`) VALUES
('2021-11-09 20:46:07', 0, 10),
('2021-11-09 21:32:49', 1, 20),
('2021-11-09 22:43:44', 2, 45);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `firmabilgileri`
--
ALTER TABLE `firmabilgileri`
  ADD PRIMARY KEY (`FirmaSeriNo`),
  ADD UNIQUE KEY `FirmaIdNo` (`FirmaIdNo`),
  ADD UNIQUE KEY `FırmaSaat` (`FirmaIdNo`);

--
-- Tablo için indeksler `personelbilgileri`
--
ALTER TABLE `personelbilgileri`
  ADD PRIMARY KEY (`PersSeriNo`),
  ADD UNIQUE KEY `FirmaIdNo` (`FirmaIdNo`);

--
-- Tablo için indeksler `saat`
--
ALTER TABLE `saat`
  ADD PRIMARY KEY (`SaatSeriNo`),
  ADD UNIQUE KEY `Saat` (`SaatKayıtTarihi`),
  ADD UNIQUE KEY `UrunStok` (`UrunStokId`),
  ADD UNIQUE KEY `UrunFirma` (`FirmaIdNo`);

--
-- Tablo için indeksler `stokbilgisi`
--
ALTER TABLE `stokbilgisi`
  ADD PRIMARY KEY (`UrunStokId`),
  ADD UNIQUE KEY `StokBilgisi` (`StokKayitTarihi`) USING BTREE;

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `firmabilgileri`
--
ALTER TABLE `firmabilgileri`
  MODIFY `FirmaSeriNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Otomatik Artan Firma No', AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `personelbilgileri`
--
ALTER TABLE `personelbilgileri`
  MODIFY `PersSeriNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Otomatik Artan Personel No', AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `saat`
--
ALTER TABLE `saat`
  MODIFY `SaatSeriNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Otomatik Artan Ürün No', AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `stokbilgisi`
--
ALTER TABLE `stokbilgisi`
  MODIFY `UrunStokId` int(20) NOT NULL AUTO_INCREMENT COMMENT 'Ürün Stok No', AUTO_INCREMENT=3;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `firmabilgileri`
--
ALTER TABLE `firmabilgileri`
  ADD CONSTRAINT `firmabilgileri_ibfk_1` FOREIGN KEY (`FirmaIdNo`) REFERENCES `personelbilgileri` (`FirmaIdNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `stokbilgisi`
--
ALTER TABLE `stokbilgisi`
  ADD CONSTRAINT `stokbilgisi_ibfk_1` FOREIGN KEY (`UrunStokId`) REFERENCES `saat` (`UrunStokId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
