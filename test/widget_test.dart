import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_resep/main.dart';
import 'package:flutter_resep/pages/login_page.dart';
void main() {
  testWidgets('App starts with LoginPage when not logged in', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false));
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
