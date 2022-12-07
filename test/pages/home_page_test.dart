import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget/pages/home_page.dart';

void main() {
  group('Home page test', () {
    testWidgets("Change product name after each click ",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));
      expect(find.text(products[0].name), findsOneWidget);
      for (var i = 1; i < products.length; i++) {
        await tester.tap(find.text("Check"));
        await tester.pump();
        expect(find.text(products[i].name), findsOneWidget);
      }
    });
    testWidgets("Show result after each click ", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(),
      ));

      await tester.enterText(find.byKey(const Key("priceInput")), "3");
      await tester.tap(find.text("Check"));
      await tester.pump();
      expect(find.text("passed"), findsOneWidget);

      await tester.tap(find.text("Next"));
      await tester.pump();

      await tester.enterText(find.byKey(const Key("priceInput")), "4");
      await tester.pump();
      expect(find.text("failed"), findsOneWidget);

      await tester.enterText(find.byKey(const Key("priceInput")), "5");
      await tester.pump();
      expect(find.text("passed"), findsOneWidget);
    });
  });
}
