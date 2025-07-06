import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_resep/main.dart';
import 'package:flutter_resep/pages/splash_screen.dart';

void main() {
  testWidgets('App starts with SplashScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
