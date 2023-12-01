// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:study_riverpod/step_01/main_01.dart';

void main() {
  testWidgets('Widget表示テスト', (WidgetTester tester) async {
    // Widgetの構築
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );
    // 非同期処理が終わるのを待つ
    await tester.pumpAndSettle();

    expect(find.text('タイトル'), findsOneWidget);
    expect(find.text('テスト1'), findsOneWidget);
    expect(find.text('やまだたろう'), findsOneWidget);
  });
}
