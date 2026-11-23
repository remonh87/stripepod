/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'model/payment.dart' as _ikfleofm;
import 'model/payment_status.dart' as _i00yjj1v;
import 'model/product.dart' as _igfqb4xa;
import 'model/stripe_payment_info.dart' as _i6iefg2g;
export 'model/payment.dart';
export 'model/payment_status.dart';
export 'model/product.dart';
export 'model/stripe_payment_info.dart';

class Protocol extends _is.DatabaseSerializationManager
    implements _is.DatabaseProtocolDeserializationProvider {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  _is.ProtocolDeserialization get deserializationMetadata =>
      _is.ProtocolDeserialization.cached(
        this,
        types: const [
          _is.getType<_ikfleofm.Payment>,
          _is.getType<_i00yjj1v.PaymentStatus>,
          _is.getType<_igfqb4xa.Product>,
          _is.getType<_i6iefg2g.StripePaymentInfo>,
          _is.getType<_ikfleofm.Payment?>,
          _is.getType<_i00yjj1v.PaymentStatus?>,
          _is.getType<_igfqb4xa.Product?>,
          _is.getType<_i6iefg2g.StripePaymentInfo?>,
        ],
        modules: const [_isp.Protocol.new],
        classNames: const [
          'Payment',
          'PaymentStatus',
          'Product',
          'StripePaymentInfo',
        ],
      );

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    ..._ownTableDefinitions,
    ..._isp.Protocol.targetTableDefinitions,
  ];

  static List<_isp.TableDefinition> get _ownTableDefinitions => [
    _isp.TableDefinition(
      name: 'payments',
      dartName: 'Payment',
      schema: 'public',
      module: 'stripepod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'stripeId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'amount',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'currency',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PaymentStatus',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
  ];

  static String? getClassNameFromObjectJson(dynamic data) =>
      _is.ProtocolDeserialization.readClassName(data);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    final rawDataClassName = _is.ProtocolDeserialization.readClassName(data);
    final dataClassName = rawDataClassName;
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _is.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _ikfleofm.Payment) {
      return _ikfleofm.Payment.fromJson(data) as T;
    }
    if (t == _i00yjj1v.PaymentStatus) {
      return _i00yjj1v.PaymentStatus.fromJson(data) as T;
    }
    if (t == _igfqb4xa.Product) {
      return _igfqb4xa.Product.fromJson(data) as T;
    }
    if (t == _i6iefg2g.StripePaymentInfo) {
      return _i6iefg2g.StripePaymentInfo.fromJson(data) as T;
    }
    if (t == _is.getType<_ikfleofm.Payment?>()) {
      return (data != null ? _ikfleofm.Payment.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i00yjj1v.PaymentStatus?>()) {
      return (data != null ? _i00yjj1v.PaymentStatus.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_igfqb4xa.Product?>()) {
      return (data != null ? _igfqb4xa.Product.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i6iefg2g.StripePaymentInfo?>()) {
      return (data != null ? _i6iefg2g.StripePaymentInfo.fromJson(data) : null)
          as T;
    }
    final modules = deserializationMetadata.modulesForDeserialization(
      t,
      className: rawDataClassName,
    );
    for (final module in modules) {
      try {
        return module.deserialize<T>(data, t);
      } on _is.DeserializationTypeNotFoundException catch (_) {}
    }

    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _ikfleofm.Payment => 'Payment',
      _i00yjj1v.PaymentStatus => 'PaymentStatus',
      _igfqb4xa.Product => 'Product',
      _i6iefg2g.StripePaymentInfo => 'StripePaymentInfo',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('stripepod.', '');
    }

    switch (data) {
      case _ikfleofm.Payment():
        return 'Payment';
      case _i00yjj1v.PaymentStatus():
        return 'PaymentStatus';
      case _igfqb4xa.Product():
        return 'Product';
      case _i6iefg2g.StripePaymentInfo():
        return 'StripePaymentInfo';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Payment') {
      return deserialize<_ikfleofm.Payment>(data['data']);
    }
    if (dataClassName == 'PaymentStatus') {
      return deserialize<_i00yjj1v.PaymentStatus>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_igfqb4xa.Product>(data['data']);
    }
    if (dataClassName == 'StripePaymentInfo') {
      return deserialize<_i6iefg2g.StripePaymentInfo>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      return _isp.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(10),
      });
    }
    return super.deserializeByClassName(data);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _ikfleofm.Payment:
        return _ikfleofm.Payment.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  List<_isp.TableDefinition> getOwnTableDefinitions() => _ownTableDefinitions;

  @override
  String getModuleName() => 'stripepod';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _isp.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
