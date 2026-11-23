/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _ida;
import 'package:http/http.dart' as _i85jenna;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'package:stripepod_client/src/protocol/model/payment.dart' as _ig1nijhj;
import 'package:stripepod_client/src/protocol/model/product.dart' as _i4unprgg;
import 'package:stripepod_client/src/protocol/model/stripe_payment_info.dart'
    as _izmhg959;
import 'protocol.dart' as _il2as5qe;

/// Endpoint that will create a payment intent and return the payment intent
/// client secret
/// {@category Endpoint}
class EndpointPay extends _isc.EndpointRef {
  EndpointPay(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'pay';

  _ida.Future<_izmhg959.StripePaymentInfo> pay(int productId) =>
      caller.callServerEndpoint<_izmhg959.StripePaymentInfo>(
        'pay',
        'pay',
        {'productId': productId},
      );

  _ida.Future<_ig1nijhj.Payment> getPaymentById(String stripeIntentId) =>
      caller.callServerEndpoint<_ig1nijhj.Payment>(
        'pay',
        'getPaymentById',
        {'stripeIntentId': stripeIntentId},
      );
}

/// {@category Endpoint}
class EndpointProduct extends _isc.EndpointRef {
  EndpointProduct(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'product';

  _ida.Future<_i4unprgg.Product> getProduct(int id) =>
      caller.callServerEndpoint<_i4unprgg.Product>(
        'product',
        'getProduct',
        {'id': id},
      );
}

class Client extends _isc.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _isc.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_isc.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i85jenna.Client? httpClientOverride,
  }) : super(
         host,
         _il2as5qe.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
         httpClientOverride: httpClientOverride,
       ) {
    pay = EndpointPay(this);
    product = EndpointProduct(this);
  }

  late final EndpointPay pay;

  late final EndpointProduct product;

  @override
  Map<String, _isc.EndpointRef> get endpointRefLookup => {
    'pay': pay,
    'product': product,
  };

  @override
  Map<String, _isc.ModuleEndpointCaller> get moduleLookup => {};
}
