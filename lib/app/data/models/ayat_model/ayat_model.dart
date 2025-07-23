import 'ayat.dart';
import 'surat_sebelumnya.dart';
import 'surat_selanjutnya.dart';

class AyatModel {
  bool? status;
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;
  List<Ayat>? ayat;
  SuratSelanjutnya? suratSelanjutnya;
  SuratSebelumnya? suratSebelumnya;

  AyatModel({
    this.status,
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
    this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory AyatModel.fromJson(Map<String, dynamic> json) => AyatModel(
    status: json['status'] as bool?,
    nomor: json['nomor'] as int?,
    nama: json['nama'] as String?,
    namaLatin: json['nama_latin'] as String?,
    jumlahAyat: json['jumlah_ayat'] as int?,
    tempatTurun: json['tempat_turun'] as String?,
    arti: json['arti'] as String?,
    deskripsi: json['deskripsi'] as String?,
    audio: json['audio'] as String?,
    ayat: (json['ayat'] as List<dynamic>?)
        ?.map((e) => Ayat.fromJson(e as Map<String, dynamic>))
        .toList(),
    suratSelanjutnya: json['surat_selanjutnya'] == null
        ? null
        : SuratSelanjutnya.fromJson(
            json['surat_selanjutnya'] as Map<String, dynamic>,
          ),
    suratSebelumnya: json['surat_sebelumnya'] == null
        ? null
        : SuratSebelumnya.fromJson(
            json['surat_sebelumnya'] as Map<String, dynamic>,
          ),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'nomor': nomor,
    'nama': nama,
    'nama_latin': namaLatin,
    'jumlah_ayat': jumlahAyat,
    'tempat_turun': tempatTurun,
    'arti': arti,
    'deskripsi': deskripsi,
    'audio': audio,
    'ayat': ayat?.map((e) => e.toJson()).toList(),
    'surat_selanjutnya': suratSelanjutnya?.toJson(),
    'surat_sebelumnya': suratSebelumnya?.toJson(),
  };
}
