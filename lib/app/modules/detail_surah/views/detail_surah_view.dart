import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_apps/app/routes/app_pages.dart';
import 'package:quran_apps/app/theme/app_colors.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  const DetailSurahView({super.key});
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};

    final String surahName = args['surahName'] ?? '-';

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Surah'), centerTitle: true),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(
                Routes.PLAYER_DETAIL_SURAH,
                arguments: {'surahName': surahName},
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded
              ),
            ),
            child: const Text("Mulai Membaca & Mendengar"),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 40),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              children: [
                Text(
                  'An-Nas',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Manusia',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(width: 100, child: Divider(color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Makiyyah',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.circle, color: Colors.white, size: 6),
                    ),
                    Text(
                      '6 Ayat',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Tentang Surah Ini',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Add more details about the Surah here
          const Text(
            'This is where the details of the Surah will be displayed.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
