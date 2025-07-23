import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quran_apps/app/routes/app_pages.dart';
import 'package:quran_apps/app/theme/app_colors.dart';

import '../controllers/home_controller.dart';
import 'widgets/search_box.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assalamu'alaikum",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            Text(
              "Mari Mengaji",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: const Text(
                  'Terakhir Dibaca',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                subtitle: const Text(
                  'Al-Fatihah',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  size: 30,
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
                  // Aksi ketika tile ditekan
                },
              ),
            ),
            const SizedBox(height: 6),
            SearchBox(
              controller: searchController,
              onChanged: (value) {
                // handle pencarian di sini
              },
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAIL_SURAH,
                        arguments: {
                          'surahNumber': index + 1,
                          'surahName': 'Al-Fatihah',
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              '114',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        title: const Text(
                          'Al-Fatihah',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: const Text('Pembukaan -  7 Ayat'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
