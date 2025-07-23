class Ayat {
  int? id;
  int? surah;
  int? nomor;
  String? ar;
  String? tr;
  String? idn;

  Ayat({this.id, this.surah, this.nomor, this.ar, this.tr, this.idn});

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
    id: json['id'] as int?,
    surah: json['surah'] as int?,
    nomor: json['nomor'] as int?,
    ar: json['ar'] as String?,
    tr: json['tr'] as String?,
    idn: json['idn'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'surah': surah,
    'nomor': nomor,
    'ar': ar,
    'tr': tr,
    'idn': idn,
  };
}
