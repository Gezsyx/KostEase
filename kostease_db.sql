-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Okt 2025 pada 09.29
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kostease_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin1', 'admin123', 'Fatmawati');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `nomor_kamar` varchar(10) NOT NULL,
  `tipe_kamar` varchar(50) NOT NULL,
  `harga` decimal(12,2) NOT NULL,
  `status` enum('Tersedia','Terisi') DEFAULT 'Tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nomor_kamar`, `tipe_kamar`, `harga`, `status`) VALUES
(1, 'A101', 'Single', 800000.00, 'Terisi'),
(2, 'A102', 'Single', 800000.00, 'Terisi'),
(3, 'A103', 'Single', 800000.00, 'Terisi'),
(4, 'A104', 'Single', 800000.00, 'Terisi'),
(5, 'A105', 'Single', 800000.00, 'Terisi'),
(6, 'A106', 'Single', 800000.00, 'Terisi'),
(7, 'A107', 'Single', 800000.00, 'Terisi'),
(8, 'A108', 'Single', 800000.00, 'Terisi'),
(9, 'A109', 'Single', 800000.00, 'Terisi'),
(10, 'A110', 'Single', 800000.00, 'Terisi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_penghuni` int(11) NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `jumlah` decimal(12,2) NOT NULL,
  `metode_bayar` enum('Cash','Transfer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_penghuni`, `tanggal_bayar`, `jumlah`, `metode_bayar`) VALUES
(1, 1, '2025-10-02', 800000.00, 'Cash'),
(2, 2, '2025-10-02', 800000.00, 'Transfer'),
(3, 3, '2025-10-02', 800000.00, 'Cash'),
(4, 4, '2025-10-02', 800000.00, 'Cash'),
(5, 5, '2025-10-02', 800000.00, 'Transfer'),
(6, 6, '2025-10-02', 800000.00, 'Cash'),
(7, 7, '2025-10-02', 800000.00, 'Transfer'),
(8, 8, '2025-10-02', 800000.00, 'Cash'),
(9, 9, '2025-10-02', 800000.00, 'Cash'),
(10, 10, '2025-10-02', 800000.00, 'Transfer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penghuni`
--

CREATE TABLE `penghuni` (
  `id_penghuni` int(11) NOT NULL,
  `nama_penghuni` varchar(100) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `tanggal_masuk` date NOT NULL,
  `id_kamar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penghuni`
--

INSERT INTO `penghuni` (`id_penghuni`, `nama_penghuni`, `no_hp`, `tanggal_masuk`, `id_kamar`) VALUES
(1, 'Ahmad Fauzi', '0811111111', '2025-10-01', 1),
(2, 'Dewi Lestari', '0811111112', '2025-10-01', 2),
(3, 'Budi Santoso', '0811111113', '2025-10-01', 3),
(4, 'Rina Putri', '0811111114', '2025-10-01', 4),
(5, 'Andi Pratama', '0811111115', '2025-10-01', 5),
(6, 'Siti Aisyah', '0811111116', '2025-10-01', 6),
(7, 'Agus Saputra', '0811111117', '2025-10-01', 7),
(8, 'Nurhalimah', '0811111118', '2025-10-01', 8),
(9, 'Eko Wahyu', '0811111119', '2025-10-01', 9),
(10, 'Fitri Handayani', '0811111120', '2025-10-01', 10);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`),
  ADD UNIQUE KEY `nomor_kamar` (`nomor_kamar`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_penghuni` (`id_penghuni`);

--
-- Indeks untuk tabel `penghuni`
--
ALTER TABLE `penghuni`
  ADD PRIMARY KEY (`id_penghuni`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `penghuni`
--
ALTER TABLE `penghuni`
  MODIFY `id_penghuni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_penghuni`) REFERENCES `penghuni` (`id_penghuni`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penghuni`
--
ALTER TABLE `penghuni`
  ADD CONSTRAINT `penghuni_ibfk_1` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
