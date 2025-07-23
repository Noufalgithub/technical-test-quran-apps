import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/player_detail_surah_controller.dart';
import 'widgets/audio_player_bar.dart';
import 'widgets/ayat_card.dart';

class PlayerDetailSurahView extends GetView<PlayerDetailSurahController> {
  const PlayerDetailSurahView({super.key});
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};

    final String surahName = args['surahName'] ?? '-';

    return Scaffold(
      appBar: AppBar(title: Text(surahName), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        itemCount: 10,
        itemBuilder: (context, index) {
          // final ayat = listAyat[index];

          return AyatCard(
            number: "${index + 1}",
            arabic: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
            translation:
                'In the name of Allah, the Most Gracious, the Most Merciful',
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: AudioPlayerBar(
          title: 'An-Nas',
          artist: 'Mishary Rashid Alafasy',
          current: const Duration(seconds: 0),
          total: const Duration(seconds: 35),
          isPlaying: true,
          onPlayPause: () {},
          onNext: () {},
          onPrevious: () {},
        ),
      ),
    );
  }
}
