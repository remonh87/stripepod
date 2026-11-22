@TestOn('browser')
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stripepod_client/stripepod_client.dart';
import 'package:stripepod_flutter/src/ui/platforms/pay_screen_web_impl.dart';

void main() {
  testWidgets('shows the demo product in the order summary', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PayScreenWebImpl(client: Client('http://localhost:8080/')),
      ),
    );

    expect(find.text('StripePod demo'), findsOneWidget);
    expect(find.textContaining('Arkbridge'), findsNothing);
  });
}
