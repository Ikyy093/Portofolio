CREATE DATABASE IF NOT EXISTS Portofolio;
USE Portofolio;

CREATE TABLE users ( id int NOT NULL AUTO_INCREMENT, username varchar(50) NOT NULL, password_hash varchar(255) NOT NULL, role varchar(10) NOT NULL DEFAULT 'admin', created_at timestamp DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (id) /*T![clustered_index] CLUSTERED */, UNIQUE KEY username (username) ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=30001

CREATE TABLE profiles ( id int NOT NULL AUTO_INCREMENT, user_id int NOT NULL, nama_lengkap varchar(100) DEFAULT NULL, nama_panggilan varchar(50) DEFAULT NULL, tempat_lahir varchar(50) DEFAULT NULL, tanggal_lahir date DEFAULT NULL, email varchar(100) DEFAULT NULL, telepon varchar(20) DEFAULT NULL, universitas varchar(100) DEFAULT NULL, fakultas varchar(100) DEFAULT NULL, prodi varchar(100) DEFAULT NULL, semester varchar(20) DEFAULT NULL, alamat varchar(4000) DEFAULT NULL, foto_url varchar(255) DEFAULT NULL, PRIMARY KEY (id) /*T![clustered_index] CLUSTERED */, KEY fk_profiles_users (user_id), CONSTRAINT fk_profiles_users FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=30001

CREATE TABLE skills (
id int NOT NULL AUTO_INCREMENT,
user_id int NOT NULL,
nama_skill varchar(50) DEFAULT NULL,
icon_class varchar(50) DEFAULT NULL,
PRIMARY KEY (id) /*T![clustered_index] CLUSTERED */,
KEY fk_skills_users (user_id),
CONSTRAINT fk_skills_users FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=90001

CREATE TABLE experiences (
id int NOT NULL AUTO_INCREMENT,
user_id int NOT NULL,
posisi varchar(100) DEFAULT NULL,
perusahaan varchar(100) DEFAULT NULL,
durasi varchar(50) DEFAULT NULL,
deskripsi varchar(4000) DEFAULT NULL,
created_at timestamp DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id) /*T![clustered_index] CLUSTERED */,
KEY fk_experiences_users (user_id),
CONSTRAINT fk_experiences_users FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=60001

CREATE TABLE projects (
id int NOT NULL AUTO_INCREMENT,
user_id int NOT NULL,
judul varchar(100) DEFAULT NULL,
deskripsi varchar(4000) DEFAULT NULL,
gambar_url varchar(255) DEFAULT NULL,
link_project varchar(255) DEFAULT NULL,
created_at timestamp DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id) /*T![clustered_index] CLUSTERED */,
KEY fk_projects_users (user_id),
CONSTRAINT fk_projects_users FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=90001

INSERT INTO users (id, username, password_hash, role, created_at) VALUES
(1,'admin','scrypt:32768:8:1$yAjvp98sshs6620w$df897d2cd4bbe59f66d969cedd48e6576164d983a50e70cfc0f3d9787593c9785b9074e1385b3ade552ea1f69344f8384aea9c11bf36be3c79ac4dbc57dee489','admin','2026-06-25 14:24:49');
INSERT INTO profiles
(id,user_id,nama_lengkap,nama_panggilan,tempat_lahir,tanggal_lahir,email,telepon,universitas,fakultas,prodi,semester,alamat,foto_url)
VALUES
(1,1,'M. Rizki N.','Ikyy','Kab. Semarang','2004-11-14','682024093@student.uksw.edu','081390418419','Universitas Kristen Satya Wacana','FTI','Sistem Informasi','4','Desa Barukan, Dusun Karanglo RT 11/RW 02, Kec. Tengaran','https://res.cloudinary.com/dhzqnc69x/image/upload/v1782398078/WhatsApp_Image_2026-02-20_at_21.13.06_crkfdx.jpg');
INSERT INTO skills (id, user_id, nama_skill, icon_class) VALUES
(1,1,'Python','fab fa-python'),
(2,1,'MySQL','fas fa-database'),
(3,1,'HTML','fab fa-html5'),
(4,1,'CSS','fab fa-css3-alt'),
(5,1,'JavaScript','fab fa-js'),
(6,1,'Flask','fas fa-server');
INSERT INTO experiences (id, user_id, posisi, perusahaan, durasi, deskripsi, created_at) VALUES
(1,1,'Staff Divisi IDEA (Internal, External, Aspiration)','Himpunan Mahasiswa Program Studi Sistem Informasi UKSW','2026 - Sekarang','Bertanggung jawab menampung dan menyalurkan aspirasi mahasiswa, menjaga komunikasi antara mahasiswa, dosen, dan fungsionaris, serta mendukung kolaborasi dengan pihak internal maupun eksternal. Melalui peran ini saya mengembangkan kemampuan komunikasi, koordinasi, kerja sama tim, dan problem solving dalam mendukung berbagai program kerja himpunan.','2026-06-25 15:08:09'),

(2,1,'Freelance Copywriter','Freelance','2024 - Sekarang','Bekerja sebagai freelance copywriter dengan membuat berbagai konten promosi, caption media sosial, artikel, dan materi pemasaran sesuai kebutuhan klien. Pengalaman ini membantu saya mengembangkan kemampuan menulis, komunikasi, kreativitas, serta memahami strategi penyampaian pesan yang efektif.','2026-06-25 15:11:48'),

(3,1,'Liaison Officer (LO)','Information System Festival (ISFEST) 2025 - Fakultas Teknologi Informasi, UKSW','2025','Berperan sebagai Liaison Officer (LO) pada cabang lomba Business Plan dalam Information System Festival (ISFEST) 2025. Bertanggung jawab mendampingi peserta selama rangkaian kompetisi, membantu koordinasi informasi, memastikan kebutuhan peserta terpenuhi, serta menjadi penghubung antara peserta dan panitia agar kegiatan berjalan dengan lancar. Pengalaman ini mengembangkan kemampuan komunikasi, koordinasi, pelayanan, problem solving, dan kerja sama tim.','2026-06-25 15:13:02');
INSERT INTO projects (id, user_id, judul, deskripsi, gambar_url, link_project, created_at) VALUES
(1,1,'Personal Portfolio Website','Website portofolio pribadi berbasis Flask yang terintegrasi dengan TiDB Cloud untuk mengelola profil, pengalaman, keahlian, dan proyek melalui dashboard admin. Website ini dilengkapi dengan fitur autentikasi login, CRUD data, serta upload gambar menggunakan Cloudinary.','https://res.cloudinary.com/daknwopl3/image/upload/v1782587101/portfolio/projects/cvwy13yz6khtesbzazhr.png',NULL,'2026-06-25 22:15:35'),

(2,1,'PPDB Information System','Perancangan sistem informasi Penerimaan Peserta Didik Baru (PPDB) untuk SMKN 2 Salatiga yang mencakup analisis kebutuhan, pemodelan proses bisnis (BPMN), Entity Relationship Diagram (ERD), serta perancangan basis data sebagai solusi digital dalam proses pendaftaran siswa baru.','https://res.cloudinary.com/daknwopl3/image/upload/v1782586940/portfolio/projects/jxz789ilya8a1immehcs.jpg',NULL,'2026-06-25 22:16:01'),

(3,1,'Laundry Information System','Perancangan sistem informasi laundry berbasis web untuk membantu pengelolaan data pelanggan, layanan, transaksi, serta monitoring proses laundry sehingga operasional menjadi lebih efektif dan efisien.','https://res.cloudinary.com/daknwopl3/image/upload/v1782586892/portfolio/projects/t78gxpjyftvrwtstfahf.jpg',NULL,'2026-06-25 22:16:14');
