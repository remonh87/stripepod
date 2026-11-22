import 'package:flutter/material.dart';
import 'package:flutter_stripe_web/flutter_stripe_web.dart';
import 'package:stripepod_client/stripepod_client.dart';
import 'package:web/web.dart' as web;

class PayScreenWebImpl extends StatefulWidget {
  const PayScreenWebImpl({
    required this.client,
    super.key,
  });

  final Client client;

  @override
  State<PayScreenWebImpl> createState() => _PayScreenWebImplState();
}

class _PayScreenWebImplState extends State<PayScreenWebImpl> {
  static const _desktopBreakpoint = 600.0;

  late final ValueNotifier<String?> clientSecretNotifier;
  late final ValueNotifier<String> paymentResultNotifier;
  double? _paymentElementHeight;

  @override
  void initState() {
    super.initState();
    clientSecretNotifier = ValueNotifier(null);
    paymentResultNotifier = ValueNotifier('');
  }

  @override
  void dispose() {
    clientSecretNotifier.dispose();
    paymentResultNotifier.dispose();
    super.dispose();
  }

  void pay() async {
    try {
      final paymentInfo = await widget.client.pay.pay(1);
      paymentResultNotifier.value = 'Received intent starting paymentsheet';

      _paymentElementHeight = null;
      clientSecretNotifier.value = paymentInfo.clientSecret;
    } catch (e) {
      paymentResultNotifier.value = 'Failed to pay: $e';
    }
  }

  void _confirmPayment() async {
    await WebStripe.instance.confirmPaymentElement(
      ConfirmPaymentElementOptions(
        confirmParams: ConfirmPaymentParams(
          return_url: '${web.window.location.href}check-payment',
        ),
      ),
    );
  }

  /// PaymentElement is an HtmlElementView; Flutter scroll views never see
  /// wheel/touch events over it. Cap the host div and use native CSS overflow
  /// so the browser can scroll-chain from Stripe's iframe into that div.
  Future<void> _enableNativePaymentElementScroll(double maxHeight) async {
    final heightCss = '${maxHeight}px';
    for (var i = 0; i < 120; i++) {
      final el = web.document.getElementById('payment-element');
      if (el != null) {
        final htmlEl = el as web.HTMLElement;
        htmlEl.style
          ..height = heightCss
          ..minHeight = heightCss
          ..maxHeight = heightCss
          ..overflowY = 'auto';
        return;
      }
      await Future<void>.delayed(const Duration(milliseconds: 16));
    }
  }

  void _scheduleNativeScroll(double height) {
    if (_paymentElementHeight == height) {
      return;
    }
    _paymentElementHeight = height;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _enableNativePaymentElementScroll(height);
    });
  }

  Widget _orderSummary() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text('StripePod demo'),
            Spacer(),
            Text('\$100'),
          ],
        ),
        SizedBox(height: 16),
        Divider(),
        Row(
          children: [
            Text(
              'Total',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              '\$100',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _checkoutButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
      ),
      onPressed: pay,
      child: const Text(
        'Checkout',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _confirmButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
      ),
      onPressed: _confirmPayment,
      child: const Text(
        'Confirm Payment',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _progressBox() {
    return Container(
      color: Colors.grey.withValues(alpha: 0.4),
      height: 100,
      padding: const EdgeInsets.all(16.0),
      child: ValueListenableBuilder(
        valueListenable: paymentResultNotifier,
        builder: (context, result, child) {
          return Text('Progress: \n\n $result');
        },
      ),
    );
  }

  Widget _paymentElement(String clientSecret) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        _scheduleNativeScroll(height);
        return SizedBox(
          height: height,
          width: double.infinity,
          child: PaymentElement(
            autofocus: true,
            enablePostalCode: true,
            height: height,
            onCardChanged: (_) {},
            clientSecret: clientSecret,
          ),
        );
      },
    );
  }

  Widget _desktopLayout(String? clientSecret) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _orderSummary(),
              if (clientSecret == null) ...[
                const SizedBox(height: 32),
                _checkoutButton(),
              ] else ...[
                const SizedBox(height: 32),
                _confirmButton(),
              ],
              const SizedBox(height: 16),
              _progressBox(),
            ],
          ),
        ),
        if (clientSecret != null) ...[
          const SizedBox(width: 48),
          Expanded(
            flex: 3,
            child: _paymentElement(clientSecret),
          ),
        ],
      ],
    );
  }

  Widget _mobileLayout(String? clientSecret) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _orderSummary(),
        if (clientSecret == null) ...[
          const SizedBox(height: 32),
          _checkoutButton(),
        ] else ...[
          const SizedBox(height: 24),
          Expanded(child: _paymentElement(clientSecret)),
          const SizedBox(height: 16),
          _confirmButton(),
        ],
        const SizedBox(height: 16),
        _progressBox(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Pay', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: clientSecretNotifier,
          builder: (context, clientSecret, child) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth >= _desktopBreakpoint;
                  return Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: isDesktop
                          ? constraints.maxWidth.clamp(0, 1100)
                          : constraints.maxWidth.clamp(0, 800),
                      height: constraints.maxHeight,
                      child: isDesktop
                          ? _desktopLayout(clientSecret)
                          : _mobileLayout(clientSecret),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
