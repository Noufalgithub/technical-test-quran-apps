import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:quran_apps/app/modules/home/views/home_view.dart';

void main() {
  testWidgets('HomeView is working test', (WidgetTester tester) async {
    // Inject controller secara manual karena GetView butuh controller

    await tester.pumpWidget(const GetMaterialApp(home: HomeView()));

    // Cek apakah teks "HomeView is working" muncul
    expect(find.text('HomeView is working'), findsOneWidget);
  });
}
