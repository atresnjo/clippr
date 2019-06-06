///
//  Generated code. Do not modify.
//  source: clipboard.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class ClipboardUpdateType extends $pb.ProtobufEnum {
  static const ClipboardUpdateType DELETED = ClipboardUpdateType._(0, 'DELETED');
  static const ClipboardUpdateType CREATED = ClipboardUpdateType._(1, 'CREATED');

  static const $core.List<ClipboardUpdateType> values = <ClipboardUpdateType> [
    DELETED,
    CREATED,
  ];

  static final $core.Map<$core.int, ClipboardUpdateType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClipboardUpdateType valueOf($core.int value) => _byValue[value];

  const ClipboardUpdateType._($core.int v, $core.String n) : super(v, n);
}

