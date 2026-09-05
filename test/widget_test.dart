import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter1/main.dart';

void main() {
  testWidgets('Button color change test', (WidgetTester tester) async {
    // Build app and trigger frame
    await tester.pumpWidget(const MyApp());

    // Verify initial button text
    expect(find.text('Klick mich!'), findsOneWidget);
    expect(find.text('Status: Standard'), findsOneWidget);

    // Tap button
    await tester.tap(find.text('Klick mich!'));
    await tester.pumpAndSettle();

    // Verify red state
    expect(find.text('Ich bin jetzt Rot!'), findsOneWidget);
    expect(find.text('Status: Rot aktiviert (Klicke erneut zum Zurücksetzen)'), findsOneWidget);
  });
}
