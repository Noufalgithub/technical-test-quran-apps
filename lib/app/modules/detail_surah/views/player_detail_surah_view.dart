import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_apps/app/constants/app_colors.dart';
import 'package:quran_apps/app/modules/detail_surah/controllers/detail_surah_controller.dart';

import 'widgets/audio_player_bar.dart';
import 'widgets/ayat_card.dart';

class PlayerDetailSurahView extends GetView<DetailSurahController> {
  const PlayerDetailSurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final detail = controller.surahDetail.value;

      // ignore: deprecated_member_use
      return WillPopScope(
        onWillPop: () async {
          controller.onClose();
          return true;
        },
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(detail?.namaLatin ?? ''),
              centerTitle: true,
            ),
            body: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
              itemCount: detail?.ayat?.length ?? 0,
              itemBuilder: (context, index) {
                final ayat = detail?.ayat?[index];

                return AyatCard(
                  number: ayat?.nomor.toString() ?? '',
                  arabic: ayat?.ar ?? '',
                  translation: ayat?.idn ?? '',
                );
              },
            ),

            bottomNavigationBar: StreamBuilder<DurationState>(
              stream: controller.durationState,
              builder: (context, snapshot) {
                final data = snapshot.data;
                final position = data?.position ?? Duration.zero;
                final total = data?.total ?? Duration.zero;

                return SafeArea(
                  child: AudioPlayerBar(
                    title: detail?.namaLatin ?? '',
                    artist: 'Mishary Rashid Alafasy',
                    current: formatDuration(position),
                    total: formatDuration(total),
                    progressDisplay: Slider(
                      activeColor: AppColors.primary,
                      value: position.inSeconds.toDouble(),
                      max: total.inSeconds.toDouble(),
                      onChanged: (val) {
                        controller.seek(Duration(seconds: val.toInt()));
                      },
                    ),
                    isPlaying: (controller.isPlaying.value) ? true : false,
                    onPlayPause: () {
                      if (controller.isPlaying.value) {
                        controller.player.pause();
                        controller.isPlaying(false);
                      } else {
                        controller.playAudio(detail?.audio ?? '');
                      }
                    },
                    onNext: () {
                      controller.nextSurah();
                    },
                    onPrevious: () {
                      controller.previousSurah();
                    },
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}
