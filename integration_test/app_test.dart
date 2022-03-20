import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_flutter/main.dart' as app;


void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final constantItemFinder = find.byKey(const Key ('BirdStoreViewBirdType.constant'));
  final randomItemFinder = find.byKey(const Key ('BirdStoreViewBirdType.random'));
  final firstBirdFinder = find.byKey(const Key ('MainPageBirdType.constant0'));
  final balanceFinder = find.byKey(const Key ('WalletViewbalance'));

  group('e2e tests', () {
    testWidgets('testing Bird Calculator', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      final itemFinder = find.byKey(const Key('birdCalcPage'));

      // Scroll until the item to be found appears.
      await tester.scrollUntilVisible(
        itemFinder,
        500.0,
      );
      // await delayed(2000);
      expect(itemFinder, findsOneWidget);
      await tester.tap(itemFinder);

      // Check balance - $0
      await tester.pumpAndSettle();
      final element = await balanceFinder.evaluate().first.widget as Text;
      expect(element.data, "\$0");

      //when clicking constant bird then balance increments
      await tester.pumpAndSettle();
      for (var i = 0; i < 49; ++i) {
        await tester.tap(firstBirdFinder);
        await delayed(100);
      }

      // Check balance - $49
      await tester.pumpAndSettle();
      final element2 = await balanceFinder.evaluate().first.widget as Text;
      expect(element2.data, "\$49");

      //when balance less then 49 cannot tap constant bird
      await tester.pumpAndSettle();
      await tester.tap(constantItemFinder);

      // Check balance - $49
      await tester.pumpAndSettle();
      final element3 = await balanceFinder.evaluate().first.widget as Text;
      expect(element3.data, "\$49");

      //when clicking constant bird then balance increments
      await tester.pumpAndSettle();
      for (var i = 0; i < 51; ++i) {
        await tester.tap(firstBirdFinder);
        await delayed(100);
      }

      await tester.pumpAndSettle();
      await tester.tap(randomItemFinder);

      // Check balance - $0
      await tester.pumpAndSettle();
      final element4 = await balanceFinder.evaluate().first.widget as Text;
      expect(element4.data, "\$0");
    });
  });


}

Future<void> delayed(int milliseconds) async{
  await Future.delayed(Duration(milliseconds: milliseconds));
}