import 'package:get/get.dart';
import 'package:quran_apps/app/data/models/ayat_model/ayat_model.dart';
import 'package:quran_apps/app/data/services/quran_service.dart';

class DetailSurahController extends GetxController {
  final QuranService _service = QuranService();

  var isLoading = true.obs;
  var surahDetail = Rxn<AyatModel>();

  @override
  void onReady() {
    final args = Get.arguments;
    final nomor = args['nomorSurah'] as int?;
    if (nomor != null) fetchDetailSurah(nomor);
    super.onReady();
  }

  void fetchDetailSurah(int nomor) async {
    try {
      isLoading(true);
      final result = await _service.getDetailSurah(nomor);
      surahDetail.value = result;
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat detail surah');
    } finally {
      isLoading(false);
    }
  }
}
