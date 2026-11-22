import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stripepod_client/stripepod_client.dart';
import 'package:stripepod_flutter/src/ui/pay_screen.dart';

void main() {
  testWidgets('shows the demo product in the order summary', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: PayScreen(client: Client('http://localhost:8080/'))),
    );

    expect(find.text('StripePod demo'), findsOneWidget);
    expect(find.textContaining('Arkbridge'), findsNothing);
  });
}
