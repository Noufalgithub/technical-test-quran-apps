import 'package:get/get.dart';

import '../modules/detail_surah/bindings/detail_surah_binding.dart';
import '../modules/detail_surah/views/detail_surah_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/player_detail_surah/bindings/player_detail_surah_binding.dart';
import '../modules/player_detail_surah/views/player_detail_surah_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SURAH,
      page: () => const DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
    GetPage(
      name: _Paths.PLAYER_DETAIL_SURAH,
      page: () => const PlayerDetailSurahView(),
      binding: PlayerDetailSurahBinding(),
    ),
  ];
}
