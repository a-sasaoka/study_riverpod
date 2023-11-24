// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:study_riverpod/main.dart';

void main() {
  testWidgets('Widget動作テスト', (WidgetTester tester) async {
    // Widgetの構築
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // 初期表示
    expect(find.text('0'), findsOneWidget);

    // 「+」を2回クリックした後の確認
    await tester.tap(find.text('+'));
    await tester.tap(find.text('+'));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    // 「-」を1回クリックした後の確認
    await tester.tap(find.text('-'));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}
