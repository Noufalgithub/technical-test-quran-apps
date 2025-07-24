# 📖 Quran Apps

Quran Apps adalah aplikasi mobile Flutter yang menyediakan kemudahan untuk membaca dan mendengarkan Al-Qur'an secara lengkap dan interaktif. Aplikasi ini mendukung fitur **pencarian surah**, **terakhir dibaca**, **audio player** dan tampilan modern untuk memudahkan pengguna dalam mengakses ayat suci Al-Qur'an.

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

## 📦 API yang Digunakan

- List Surah: `https://open-api.my.id/api/quran/surah`
- Detail Surah: `https://open-api.my.id/api/quran/surah/{nomor}`

---

## 🏁 Cara Menjalankan

```bash
git clone https://github.com/Noufalgithub/technical-test-quran-apps.git
cd quran_apps
flutter pub get
flutter run


