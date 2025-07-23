import 'package:get/get.dart';
import 'package:quran_apps/app/data/services/quran_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuranService());
    Get.lazyPut(() => HomeController(Get.find<QuranService>()));
  }
}
