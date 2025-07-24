# 📖 Quran Apps

Quran Apps adalah aplikasi mobile Flutter yang menyediakan kemudahan untuk membaca dan mendengarkan Al-Qur'an secara lengkap dan interaktif. Aplikasi ini mendukung fitur **audio player**, **terakhir dibaca**, dan tampilan modern untuk memudahkan pengguna dalam mengakses ayat suci Al-Qur'an.

---

## ✨ Fitur Unggulan

- 🔍 **Cari Surah** berdasarkan nama
- 📚 **Daftar Surah** (114 surah) lengkap
- 📖 **Detail Surah**:
  - Teks Arab
  - Latin
  - Terjemahan
  - Deskripsi
- ✅ **Terakhir Dibaca (Last Read)** – langsung tampil di halaman utama
- 🎧 **Audio Player Lengkap**:
  - Play, Pause, Resume
  - Next Ayat & Previous Ayat
  - Menampilkan progress audio
- ⏩ Navigasi ke **surah selanjutnya** dan **sebelumnya**
- 📱 UI clean, minimalis & responsive

---

## 🧪 Teknologi yang Digunakan

| Tools             | Keterangan                           |
|-------------------|--------------------------------------|
| Flutter           | Framework utama                      |
| GetX              | State Management + Routing + Binding |
| Dio               | HTTP Client untuk fetch API          |
| GetStorage        | Local storage (terakhir dibaca)      |
| Just Audio        | Pemutar audio                        |

---

## 🔧 Arsitektur Folder

lib/
├── app/
│ ├── constants/ # Warna, style, dll.
│ ├── data/ # Service API & model
│ ├── modules/ # Fitur modular (home, detail, dll.)
│ ├── routes/ # App pages & navigation
│ └── widgets/ # Komponen UI reusable
├── main.dart


---

## 📦 API yang Digunakan

- List Surah: `https://open-api.my.id/api/quran/surah`
- Detail Surah: `https://open-api.my.id/api/quran/surah/{nomor}`

---

## 📸 Tampilan Aplikasi

| Home | Detail Surah | Audio Player |
|------|---------------|---------------|
| ![Home](screenshots/home.jpg) | ![Detail](screenshots/detail.jpg) | ![Player](screenshots/player.jpg) |

---

## 🏁 Cara Menjalankan

```bash
flutter pub get
flutter run


