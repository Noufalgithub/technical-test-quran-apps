import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_apps/app/constants/string_constants.dart';
import 'package:quran_apps/app/data/models/surah_model/surah_model.dart';
import 'package:quran_apps/app/data/services/quran_service.dart';
import 'package:quran_apps/main.dart';

class HomeController extends GetxController {
  final QuranService _quranService;

  HomeController(this._quranService);

  var allSurah = <SurahModel>[].obs;
  var surahList = <SurahModel>[].obs;
  var isLoading = false.obs;
  var searchText = ''.obs;
  var lastReadNomorSurah = 0.obs;

  @override
  void onInit() {
    fetchSurahs();
    debounce(
      searchText,
      (_) => applyFilter(),
      time: const Duration(milliseconds: 300),
    );

    super.onInit();
  }

  void fetchSurahs() async {
    try {
      isLoading.value = true;
      final result = await _quranService.getAllSurah();
      allSurah.assignAll(result);
      surahList.assignAll(result);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void applyFilter() {
    if (searchText.value.isEmpty) {
      surahList.assignAll(allSurah);
    } else {
      surahList.assignAll(
        allSurah.where((surah) {
          final query = searchText.value.toLowerCase();
          return surah.namaLatin!.toLowerCase().contains(query) ||
              surah.arti!.toLowerCase().contains(query);
        }),
      );
    }
  }

  void saveLastRead({required int nomorSurah}) {
    box.write(StringConstants.lastReadNomorSurah, nomorSurah);

    lastReadNomorSurah.value = nomorSurah;
  }

  String getSurahNameByNumber() {
    final surah = surahList.firstWhere(
      (s) => s.nomor == lastReadNomorSurah.value,
      orElse: () => SurahModel(nomor: 0, namaLatin: '-'),
    );
    return surah.namaLatin ?? '-';
  }
}
