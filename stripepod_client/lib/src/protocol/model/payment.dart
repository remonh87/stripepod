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
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import '../model/payment_status.dart' as _ibsopln7;

abstract class Payment
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Payment._({
    this.id,
    required this.stripeId,
    required this.amount,
    required this.currency,
    required this.status,
    required this.createdAt,
  });

  factory Payment({
    int? id,
    required String stripeId,
    required int amount,
    required String currency,
    required _ibsopln7.PaymentStatus status,
    required DateTime createdAt,
  }) = _PaymentImpl;

  factory Payment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Payment(
      id: jsonSerialization['id'] as int?,
      stripeId: jsonSerialization['stripeId'] as String,
      amount: jsonSerialization['amount'] as int,
      currency: jsonSerialization['currency'] as String,
      status: _ibsopln7.PaymentStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String stripeId;

  int amount;

  String currency;

  _ibsopln7.PaymentStatus status;

  DateTime createdAt;

  /// Returns a shallow copy of this [Payment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Payment copyWith({
    int? id,
    String? stripeId,
    int? amount,
    String? currency,
    _ibsopln7.PaymentStatus? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Payment',
      if (id != null) 'id': id,
      'stripeId': stripeId,
      'amount': amount,
      'currency': currency,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Payment',
      if (id != null) 'id': id,
      'stripeId': stripeId,
      'amount': amount,
      'currency': currency,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PaymentImpl extends Payment {
  _PaymentImpl({
    int? id,
    required String stripeId,
    required int amount,
    required String currency,
    required _ibsopln7.PaymentStatus status,
    required DateTime createdAt,
  }) : super._(
         id: id,
         stripeId: stripeId,
         amount: amount,
         currency: currency,
         status: status,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Payment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Payment copyWith({
    Object? id = _Undefined,
    String? stripeId,
    int? amount,
    String? currency,
    _ibsopln7.PaymentStatus? status,
    DateTime? createdAt,
  }) {
    return Payment(
      id: id is int? ? id : this.id,
      stripeId: stripeId ?? this.stripeId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
