import 'package:get/get.dart';
import 'package:quran_apps/app/data/models/surah_model/surah_model.dart';
import 'package:quran_apps/app/data/services/quran_service.dart';

class HomeController extends GetxController {
  final QuranService _quranService;

  HomeController(this._quranService);

  var surahList = <SurahModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSurahs();
  }

  void fetchSurahs() async {
    try {
      isLoading.value = true;
      final result = await _quranService.getAllSurah();
      surahList.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
