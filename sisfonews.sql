SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `berita`;
DROP TABLE IF EXISTS `kategori`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `level`;
DROP TABLE IF EXISTS `kontributor`;
DROP TABLE IF EXISTS `editor`;
DROP TABLE IF EXISTS `komentar`;
DROP TABLE IF EXISTS `pengunjung_terdaftar`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `berita` (
    `id_berita` INTEGER NOT NULL,
    `tglwaktu_terbit` DATETIME NOT NULL,
    `judul` VARCHAR(100) NOT NULL,
    `isi` TEXT NOT NULL,
    `gambar_utama` VARCHAR(20) NOT NULL,
    `id_kategori` INTEGER NOT NULL,
    `id_kontributor` INTEGER NOT NULL,
    PRIMARY KEY (`id_berita`)
);

CREATE TABLE `kategori` (
    `id_kategori` INTEGER NOT NULL,
    `nama_kategori` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`id_kategori`)
);

CREATE TABLE `user` (
    `id_user` INTEGER NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `username` VARCHAR(50) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `no_hp` INTEGER NOT NULL,
    `id_level` INTEGER NOT NULL,
    PRIMARY KEY (`id_user`)
);

CREATE TABLE `level` (
    `id_level` INTEGER NOT NULL,
    `nama_level` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id_level`)
);

CREATE TABLE `kontributor` (
    `id_kontributor` INTEGER NOT NULL,
    `nama_lengkap` VARCHAR(100) NOT NULL,
    `keterangan` TEXT NOT NULL,
    `foto` VARCHAR(100) NOT NULL,
    `id_user` INTEGER NOT NULL,
    PRIMARY KEY (`id_kontributor`)
);

CREATE TABLE `editor` (
    `id_editor` INTEGER NOT NULL,
    `nama_lengkap` VARCHAR(100) NOT NULL,
    `keterangan` TEXT NOT NULL,
    `tahun_masuk` INTEGER NOT NULL,
    `rating` SMALLINT NOT NULL,
    `id_user` INTEGER NOT NULL,
    PRIMARY KEY (`id_editor`)
);

CREATE TABLE `komentar` (
    `id_komentar` INTEGER NOT NULL,
    `tglwaktu_komentar` DATETIME NOT NULL,
    `isi_komentar` TEXT NOT NULL,
    `validitas` SMALLINT NOT NULL,
    `id_berita` INTEGER NOT NULL,
    PRIMARY KEY (`id_komentar`)
);

CREATE TABLE `pengunjung_terdaftar` (
    `id_pengunjung` INTEGER NOT NULL,
    `nama_pengunjung` VARCHAR(100) NOT NULL,
    `id_user` INTEGER NOT NULL,
    PRIMARY KEY (`id_pengunjung`)
);

ALTER TABLE `berita` ADD FOREIGN KEY (`id_kontributor`) REFERENCES `kontributor`(`id_kontributor`);
ALTER TABLE `berita` ADD FOREIGN KEY (`id_kategori`) REFERENCES `kategori`(`id_kategori`);
ALTER TABLE `user` ADD FOREIGN KEY (`id_level`) REFERENCES `level`(`id_level`);
ALTER TABLE `kontributor` ADD FOREIGN KEY (`id_user`) REFERENCES `user`(`id_user`);
ALTER TABLE `editor` ADD FOREIGN KEY (`id_user`) REFERENCES `user`(`id_user`);
ALTER TABLE `komentar` ADD FOREIGN KEY (`id_berita`) REFERENCES `berita`(`id_berita`);
ALTER TABLE `pengunjung_terdaftar` ADD FOREIGN KEY (`id_user`) REFERENCES `user`(`id_user`);