import 'package:dio/dio.dart';
import 'package:quran_apps/app/data/models/ayat_model/ayat_model.dart';
import 'package:quran_apps/app/data/models/surah_model/surah_model.dart';
import 'dio_client.dart';

class QuranService {
  final Dio _dio = DioClient.instance;

  Future<List<SurahModel>> getAllSurah() async {
    try {
      final response = await _dio.get('/surah');
      final List data = response.data;
      return data.map((e) => SurahModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<AyatModel> getDetailSurah(int nomor) async {
    try {
      final response = await _dio.get('/surah/$nomor');
      return AyatModel.fromJson(response.data ?? {});
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
