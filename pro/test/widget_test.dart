import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro/pages/navigation.dart'; // Import main.dart directly without aliasing

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp()); // Call MyApp directly

    // Verify initial counter state.
    expect(find.text('0'), findsOneWidget); // Initial counter is 0
    expect(find.text('1'), findsNothing);

    // Simulate tapping the "+" button (assuming you have a button with an add icon).
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
