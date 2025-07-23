import 'package:get/get.dart';
import 'package:quran_apps/app/data/models/surah_model/surah_model.dart';
import 'package:quran_apps/app/data/services/quran_service.dart';

class HomeController extends GetxController {
  final QuranService _quranService;

  HomeController(this._quranService);

  var allSurah = <SurahModel>[].obs;
  var surahList = <SurahModel>[].obs;
  var isLoading = false.obs;
  var searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSurahs();
    debounce(
      searchText,
      (_) => applyFilter(),
      time: const Duration(milliseconds: 300),
    );
  }

  void fetchSurahs() async {
    try {
      isLoading.value = true;
      final result = await _quranService.getAllSurah();
      allSurah.assignAll(result);
      surahList.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
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
}
