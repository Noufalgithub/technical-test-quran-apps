import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_apps/app/data/models/ayat_model/ayat_model.dart';
import 'package:quran_apps/app/data/services/quran_service.dart';
import 'package:quran_apps/app/modules/home/controllers/home_controller.dart';
import 'package:rxdart/rxdart.dart'
    show CombineLatestStream, WhereTypeExtension;

class DetailSurahController extends GetxController {
  final homeController = Get.find<HomeController>();

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

  Future<void> fetchDetailSurah(int nomor) async {
    surahDetail.value = null;

    try {
      isLoading(true);
      final result = await _service.getDetailSurah(nomor);
      currentSurahNumber(nomor);
      surahDetail.value = result;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal memuat detail surah',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
      Get.snackbar(
        'Error',
        'Gagal memutar audio',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void seek(Duration position) {
    player.seek(position);
  }

  void nextSurah() {
    if (currentSurahNumber.value < 114) {
      currentSurahNumber(currentSurahNumber.value + 1);
      fetchDetailSurah(currentSurahNumber.value + 1);

      player.pause();
      isPlaying(false);

      homeController.saveLastRead(nomorSurah: currentSurahNumber.value + 1);
    }
  }

  void previousSurah() {
    if (currentSurahNumber.value > 1) {
      currentSurahNumber(currentSurahNumber.value - 1);
      fetchDetailSurah(currentSurahNumber.value - 1);

      player.pause();
      isPlaying(false);

      homeController.saveLastRead(nomorSurah: currentSurahNumber.value - 1);
    }
  }
}

class DurationState {
  final Duration position;
  final Duration total;

  DurationState({required this.position, required this.total});
}
