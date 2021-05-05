-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2021 at 02:44 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tiketing_pesawat`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_bandara`
--

CREATE TABLE `tb_bandara` (
  `id_bandara` varchar(11) NOT NULL,
  `kode` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bandara`
--

INSERT INTO `tb_bandara` (`id_bandara`, `kode`, `nama`, `kota`) VALUES
('BAN180001', 'SRG', ' Bandar Udara Internasional Achmad Yani', 'Semarang'),
('BAN180002', 'CGK ', ' Bandar Udara Internasional Soekarno-Hatta', 'Tangerang'),
('BAN180003', 'HLP', 'Bandar Udara Internasional Halim Perdanakusuma', 'Jakarta'),
('BAN180004', 'DPS ', ' Bandar Udara Internasional Ngurah Rai', 'Denpasar'),
('BAN180005', 'BPN', ' Bandar Udara Sultan Aji Muhammad Sulaiman', 'Balik Papan'),
('BAN180006', 'JOG', ' Bandar Udara Internasional Adisutjipto', 'Seleman'),
('BAN180007', 'BDO', 'Bandar Udara Internasional Husein Sastranegara', 'Bandung'),
('BAN180008', 'SUB', 'Bandar Udara Internasional Juanda', 'Sidoarjo'),
('BAN180009', 'MDC ', ' Bandar Udara Internasional Sam Ratulangi', 'Manado'),
('BAN180010', 'DJJ', ' Bandar Udara Internasional Sentani', 'Jayapura');

-- --------------------------------------------------------

--
-- Table structure for table `tb_booking`
--

CREATE TABLE `tb_booking` (
  `id_booking` varchar(11) NOT NULL,
  `id_customer` varchar(11) NOT NULL,
  `tgl_booking` date NOT NULL,
  `jumlah_penumpang` int(11) NOT NULL,
  `total_tarif` varchar(255) NOT NULL,
  `status_bayar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_booking`
--

INSERT INTO `tb_booking` (`id_booking`, `id_customer`, `tgl_booking`, `jumlah_penumpang`, `total_tarif`, `status_bayar`) VALUES
('BOO210001', 'CUS210002', '2021-04-29', 13, '120000', '212112112121'),
('BOO210002', '', '2021-04-29', 1, '0', 'belum'),
('BOO210003', 'CUS210002', '2021-04-29', 1, '0', 'belum'),
('BOO210004', 'CUS210002', '2021-04-30', 1, 'NaN', 'belum');

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id_customer` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `negara` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_customer`
--

INSERT INTO `tb_customer` (`id_customer`, `nama`, `email`, `kota`, `negara`) VALUES
('CUS210001', 'toni ', 'toni@gmail.com', 'malang', 'indonesia'),
('CUS210002', 'saddam', 'saddam@gmail.com', 'malang', 'indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `tb_dtl_booking`
--

CREATE TABLE `tb_dtl_booking` (
  `id_detail` int(11) NOT NULL,
  `id_tarif` varchar(11) NOT NULL,
  `id_booking` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_dtl_booking`
--

INSERT INTO `tb_dtl_booking` (`id_detail`, `id_tarif`, `id_booking`) VALUES
(1, '', 'BOO210001'),
(2, '', 'BOO210002'),
(3, '', 'BOO210003'),
(4, '', 'BOO210004');

-- --------------------------------------------------------

--
-- Table structure for table `tb_passenger`
--

CREATE TABLE `tb_passenger` (
  `id_passenger` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `no_kursi` varchar(50) NOT NULL,
  `id_detail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_passenger`
--

INSERT INTO `tb_passenger` (`id_passenger`, `nama`, `no_kursi`, `id_detail`) VALUES
(1, 'saddam bapack', 'BIS', 1),
(2, 'saddam moms', 'BIS', 1),
(3, 'sadam boi', 'BIS', 1),
(4, 'sadd', 'BIS', 1),
(5, 'dumb', 'BIS', 1),
(6, 'sad brak', 'BIS', 1),
(7, 'sadddd', 'BIS', 1),
(8, 'daaaa', 'BIS', 1),
(9, 'duhh', 'BIS', 1),
(10, 'asas', 'BIS', 1),
(11, 'sas', 'BIS', 1),
(12, 'asaas', 'BIS', 1),
(13, 'sasas', 'BIS', 1),
(14, 'saddam bapack', 'BIS', 2),
(15, 'saddam bapack', 'BIS', 2),
(16, 'saddam bapack', 'BIS', 3),
(17, 'saddam bapack', 'BIS', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penerbangan`
--

CREATE TABLE `tb_penerbangan` (
  `id_penerbangan` varchar(11) NOT NULL,
  `id_bandara` varchar(11) NOT NULL,
  `id_pesawat` varchar(11) NOT NULL,
  `tgl_penerbangan` date NOT NULL,
  `asal` varchar(255) NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `jam_berangkat` time NOT NULL,
  `jam_tiba` time NOT NULL,
  `bandara_tujuan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penerbangan`
--

INSERT INTO `tb_penerbangan` (`id_penerbangan`, `id_bandara`, `id_pesawat`, `tgl_penerbangan`, `asal`, `tujuan`, `jam_berangkat`, `jam_tiba`, `bandara_tujuan`) VALUES
('PEN210001', 'BAN180003', 'PES180004', '2021-04-28', 'Jakarta', 'Jakarta', '00:00:00', '13:20:00', 'Bandar Udara Internasional Halim Perdanakusuma'),
('PEN210002', 'BAN180001', 'PES180006', '2121-12-21', 'Semarang', 'Semarang', '02:33:00', '12:21:00', ' Bandar Udara Internasional Achmad Yani');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesawat`
--

CREATE TABLE `tb_pesawat` (
  `id_pesawat` varchar(11) NOT NULL,
  `tipe_pesawat` varchar(255) NOT NULL,
  `jml_kursi_ekonomi` varchar(255) NOT NULL,
  `jml_kursi_bisnis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pesawat`
--

INSERT INTO `tb_pesawat` (`id_pesawat`, `tipe_pesawat`, `jml_kursi_ekonomi`, `jml_kursi_bisnis`) VALUES
('PES180001', 'Airbus A330-300', '213', '34'),
('PES180002', 'Boeing 737 Max 8', '162', '8'),
('PES180003', 'Airbus A330-200', '186', '36'),
('PES180004', 'Bombardier CRJ1000 NextGen', '96', '20'),
('PES180005', 'ATR 72-600', '66', '20'),
('PES180006', 'Boeing 777-300ER', '26', '367'),
('PES180007', 'Boeing 737-800NG', '150', '12');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tarif_penerbangan`
--

CREATE TABLE `tb_tarif_penerbangan` (
  `id_tarif` varchar(11) NOT NULL,
  `id_penerbangan` varchar(11) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `tarif` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tarif_penerbangan`
--

INSERT INTO `tb_tarif_penerbangan` (`id_tarif`, `id_penerbangan`, `kelas`, `tarif`) VALUES
('TAR210001', 'PEN210001', 'Bisnis', '2000000'),
('TAR210002', 'PEN210002', 'Ekonomi', '1200000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `level`) VALUES
(1, 'user', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'manager', '1d0258c2440a8d19e716292b231e3190', 'manager'),
(3, 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas'),
(4, 'super', '21232f297a57a5a743894a0e4a801fc3', 'superuser');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_bandara`
--
ALTER TABLE `tb_bandara`
  ADD PRIMARY KEY (`id_bandara`);

--
-- Indexes for table `tb_booking`
--
ALTER TABLE `tb_booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indexes for table `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `tb_dtl_booking`
--
ALTER TABLE `tb_dtl_booking`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `tb_passenger`
--
ALTER TABLE `tb_passenger`
  ADD PRIMARY KEY (`id_passenger`);

--
-- Indexes for table `tb_penerbangan`
--
ALTER TABLE `tb_penerbangan`
  ADD PRIMARY KEY (`id_penerbangan`);

--
-- Indexes for table `tb_pesawat`
--
ALTER TABLE `tb_pesawat`
  ADD PRIMARY KEY (`id_pesawat`);

--
-- Indexes for table `tb_tarif_penerbangan`
--
ALTER TABLE `tb_tarif_penerbangan`
  ADD PRIMARY KEY (`id_tarif`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_dtl_booking`
--
ALTER TABLE `tb_dtl_booking`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_passenger`
--
ALTER TABLE `tb_passenger`
  MODIFY `id_passenger` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
