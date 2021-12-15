-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 25 Ara 2019, 09:02:07
-- Sunucu sürümü: 10.1.36-MariaDB
-- PHP Sürümü: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `orcun_madran`
--
CREATE DATABASE IF NOT EXISTS `orcun_madran` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `orcun_madran`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitap`
--

CREATE TABLE `kitap` (
  `kitapNo` int(11) NOT NULL,
  `kitapKayit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `yazarNo` smallint(6) NOT NULL,
  `kitapTurNo` tinyint(4) NOT NULL,
  `kitapAd` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `kitapISBN` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `kitapYil` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitaptur`
--

CREATE TABLE `kitaptur` (
  `kitapTurNo` tinyint(4) NOT NULL,
  `kitapTurAdi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `kitapTurDetay` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Kitap tür bilgisi';

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar`
--

CREATE TABLE `yazar` (
  `yazarNo` smallint(6) NOT NULL,
  `yazarAd` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `yazarSoyad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `yazarURL` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Yazar bilgisi';

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kitap`
--
ALTER TABLE `kitap`
  ADD PRIMARY KEY (`kitapNo`),
  ADD UNIQUE KEY `kitapISBN` (`kitapISBN`);

--
-- Tablo için indeksler `kitaptur`
--
ALTER TABLE `kitaptur`
  ADD PRIMARY KEY (`kitapTurNo`),
  ADD UNIQUE KEY `kitapTurAdi` (`kitapTurAdi`);

--
-- Tablo için indeksler `yazar`
--
ALTER TABLE `yazar`
  ADD PRIMARY KEY (`yazarNo`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kitap`
--
ALTER TABLE `kitap`
  MODIFY `kitapNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kitaptur`
--
ALTER TABLE `kitaptur`
  MODIFY `kitapTurNo` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `yazar`
--
ALTER TABLE `yazar`
  MODIFY `yazarNo` smallint(6) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
