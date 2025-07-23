import 'package:get/get.dart';

import '../controllers/player_detail_surah_controller.dart';

class PlayerDetailSurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerDetailSurahController>(
      () => PlayerDetailSurahController(),
    );
  }
}
