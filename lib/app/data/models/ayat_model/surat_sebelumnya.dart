class SuratSebelumnya {
  int? id;
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;

  SuratSebelumnya({
    this.id,
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
  });

  factory SuratSebelumnya.fromJson(Map<String, dynamic> json) {
    return SuratSebelumnya(
      id: json['id'] as int?,
      nomor: json['nomor'] as int?,
      nama: json['nama'] as String?,
      namaLatin: json['nama_latin'] as String?,
      jumlahAyat: json['jumlah_ayat'] as int?,
      tempatTurun: json['tempat_turun'] as String?,
      arti: json['arti'] as String?,
      deskripsi: json['deskripsi'] as String?,
      audio: json['audio'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nomor': nomor,
    'nama': nama,
    'nama_latin': namaLatin,
    'jumlah_ayat': jumlahAyat,
    'tempat_turun': tempatTurun,
    'arti': arti,
    'deskripsi': deskripsi,
    'audio': audio,
  };
}
