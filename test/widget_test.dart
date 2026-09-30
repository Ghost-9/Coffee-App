import 'package:coffee_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Renders Coffee App header, search bar, and special banner',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Verify Hero title
    expect(find.text('Find the best\ncoffee for you'), findsOneWidget);

    // Verify Search bar
    expect(find.byType(TextField), findsOneWidget);

    // Verify Special For You section
    expect(find.text('Special For You'), findsOneWidget);
  });

  testWidgets('Filters coffee items via category tabs',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Tap on Espresso tab
    final espressoTab = find.text('Espresso');
    expect(espressoTab, findsOneWidget);
    await tester.tap(espressoTab);
    await tester.pump();

    // Verify Espresso appears
    expect(find.text('Double Espresso'), findsOneWidget);
    // Other categories are filtered out
    expect(find.text('Artisan Cappuccino'), findsNothing);
  });

  testWidgets('Searches for coffee drinks using real-time text query',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Enter search text
    await tester.enterText(find.byType(TextField), 'Latte');
    await tester.pump();

    expect(find.text('Velvet Caramel Latte'), findsOneWidget);
    expect(find.text('Double Espresso'), findsNothing);
  });
}
