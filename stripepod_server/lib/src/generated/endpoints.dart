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
import 'package:serverpod/serverpod.dart' as _is;
import '../pay_endpoint.dart' as _ihactqzd;
import '../product_endpoint.dart' as _ixncfng6;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'pay': _ihactqzd.PayEndpoint()
        ..initialize(
          server,
          'pay',
          null,
        ),
      'product': _ixncfng6.ProductEndpoint()
        ..initialize(
          server,
          'product',
          null,
        ),
    };
    connectors['pay'] = _is.EndpointConnector(
      name: 'pay',
      endpoint: endpoints['pay']!,
      methodConnectors: {
        'pay': _is.MethodConnector(
          name: 'pay',
          params: {
            'productId': _is.ParameterDescription(
              name: 'productId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['pay'] as _ihactqzd.PayEndpoint).pay(
                session,
                params['productId'],
              ),
        ),
        'getPaymentById': _is.MethodConnector(
          name: 'getPaymentById',
          params: {
            'stripeIntentId': _is.ParameterDescription(
              name: 'stripeIntentId',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['pay'] as _ihactqzd.PayEndpoint).getPaymentById(
                    session,
                    params['stripeIntentId'],
                  ),
        ),
      },
    );
    connectors['product'] = _is.EndpointConnector(
      name: 'product',
      endpoint: endpoints['product']!,
      methodConnectors: {
        'getProduct': _is.MethodConnector(
          name: 'getProduct',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['product'] as _ixncfng6.ProductEndpoint)
                  .getProduct(
                    session,
                    params['id'],
                  ),
        ),
      },
    );
  }
}
