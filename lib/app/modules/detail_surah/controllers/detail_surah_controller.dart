import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_apps/app/data/models/ayat_model/ayat_model.dart';
import 'package:quran_apps/app/data/services/quran_service.dart';
import 'package:rxdart/rxdart.dart'
    show CombineLatestStream, WhereTypeExtension;

class DetailSurahController extends GetxController {
  final QuranService _service = QuranService();
  final player = AudioPlayer();

  var isLoading = true.obs;
  var surahDetail = Rxn<AyatModel>();
  var isPlaying = false.obs;
  var currentSurahNumber = 1.obs;

  @override
  void onReady() {
    super.onReady();
    final args = Get.arguments;
    final nomor = args['nomorSurah'] as int?;
    if (nomor != null) fetchDetailSurah(nomor);
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }

  void fetchDetailSurah(int nomor) async {
    try {
      isLoading(true);
      final result = await _service.getDetailSurah(nomor);
      currentSurahNumber(nomor);
      surahDetail.value = result;
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat detail surah');
    } finally {
      isLoading(false);
    }
  }

  // Posisi dan durasi
  Stream<DurationState> get durationState =>
      CombineLatestStream.combine2<Duration, Duration, DurationState>(
        player.positionStream,
        player.durationStream.whereType<Duration>(),
        (position, duration) =>
            DurationState(position: position, total: duration),
      );

  Future<void> playAudio(String url) async {
    try {
      await player.setUrl(url);
      player.play();
      isPlaying(true);
    } catch (e) {
      Get.snackbar('Error', 'Gagal memutar audio');
    }
  }

  void seek(Duration position) {
    player.seek(position);
  }

  void nextSurah(String url) {
    if (currentSurahNumber.value < 114) {
      currentSurahNumber(currentSurahNumber.value + 1);
      fetchDetailSurah(currentSurahNumber.value + 1);

      playAudio(url);
    }
  }

  void previousSurah(String url) {
    if (currentSurahNumber.value > 1) {
      currentSurahNumber(currentSurahNumber.value - 1);
      fetchDetailSurah(currentSurahNumber.value - 1);

      playAudio(url);
    }
  }
}

class DurationState {
  final Duration position;
  final Duration total;

  DurationState({required this.position, required this.total});
}
