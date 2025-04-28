# GitHub Explorer

GitHub Explorer adalah aplikasi mobile berbasis Flutter yang memungkinkan pengguna untuk menjelajahi repositori dan profil GitHub mereka menggunakan GitHub REST API. Aplikasi ini menggunakan autentikasi melalui **Personal Access Token** GitHub dan menerapkan state management dengan **Provider** untuk pengelolaan data yang efisien.

## Fitur

- **Autentikasi**: Login menggunakan GitHub Personal Access Token.
- **Daftar Repositori**: Menampilkan daftar repositori publik dan privat (jika diizinkan) milik pengguna.
- **Detail Repositori**: Melihat informasi seperti deskripsi, jumlah bintang, fork, dan bahasa pemrograman.
- **Profil Pengguna**: Menampilkan detail profil seperti username, nama, bio, jumlah pengikut, dan yang diikuti.
- **UI Menarik**: Desain modern dengan kartu, tema konsisten, dan indikator loading.

## Prasyarat

- **Flutter**: Versi SDK >= 2.17.0 < 3.0.0.
- **GitHub Personal Access Token**: Diperlukan untuk mengakses GitHub API.
- **Koneksi Internet**: Untuk mengambil data dari GitHub API.

## Instalasi

1. **Kloning Repositori**:

   ```bash
   git clone https://github.com/charlospurba/github_explorer
   cd github_explorer
   ```

2. **Atur Dependensi**:

   - Ganti isi `pubspec.yaml` dengan:
     ```yaml
     name: github_explorer
     description: A Flutter app to explore GitHub repositories and user profiles.
     version: 1.0.0
     environment:
       sdk: ">=2.17.0 <3.0.0"
     dependencies:
       flutter:
         sdk: flutter
       provider: ^6.0.5
       http: ^0.13.5
       url_launcher: ^6.1.10
       flutter_spinkit: ^5.1.0
     dev_dependencies:
       flutter_test:
         sdk: flutter
     flutter:
       uses-material-design: true
     ```
   - Jalankan:
     ```bash
     flutter pub get
     ```

3. **Struktur Direktori Project**:
   ```
   github_explorer/
   ├── lib/
   │   ├── models/
   │   │   ├── repository.dart
   │   │   ├── user.dart
   │   ├── providers/
   │   │   ├── auth_provider.dart
   │   │   ├── github_provider.dart
   │   ├── screens/
   │   │   ├── auth_screen.dart
   │   │   ├── home_screen.dart
   │   │   ├── repo_detail_screen.dart
   │   │   ├── profile_screen.dart
   │   ├── services/
   │   │   ├── github_service.dart
   │   ├── widgets/
   │   │   ├── repo_card.dart
   │   ├── main.dart
   ├── pubspec.yaml
   ├── README.md
   ```

4. **Jalankan Aplikasi**:
   ```bash
   flutter run
   ```

## Mendapatkan GitHub Personal Access Token

Aplikasi memerlukan **Personal Access Token** untuk autentikasi ke GitHub API. Ikuti langkah-langkah berikut:

1. **Login ke GitHub**:

   - Buka [GitHub](https://github.com) dan login ke akun Anda.

2. **Buka Developer Settings**:

   - Klik foto profil > **Settings** > **Developer settings** (di sidebar kiri).

3. **Buat Token**:

   - Pilih **Personal access tokens** > **Tokens (classic)** > **Generate new token**.
   - Berikan nama token (misalnya "GitHub Explorer").
   - Pilih masa berlaku (misalnya 30 hari atau "No expiration").
   - Centang izin:
     - `repo`: Untuk mengakses repositori.
     - `user`: Untuk mengakses data profil.
   - Klik **Generate token** dan salin token yang muncul.

4. **Gunakan Token**:
   - Jalankan aplikasi.
   - Di layar autentikasi, masukkan token ke kolom "Enter GitHub Personal Access Token".
   - Klik **Login** untuk mengakses data.

**Catatan**: Simpan token dengan aman dan jangan bagikan. Jika token bocor, hapus dari GitHub di **Settings > Developer settings > Personal access tokens**.