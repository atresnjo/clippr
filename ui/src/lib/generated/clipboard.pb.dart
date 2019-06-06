///
//  Generated code. Do not modify.
//  source: clipboard.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, String;

import 'package:protobuf/protobuf.dart' as $pb;

import 'clipboard.pbenum.dart';

export 'clipboard.pbenum.dart';

class RegisterConnection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RegisterConnection', package: const $pb.PackageName('Clippr'))
    ..aOS(1, 'deviceName')
    ..hasRequiredFields = false
  ;

  RegisterConnection() : super();
  RegisterConnection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RegisterConnection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RegisterConnection clone() => RegisterConnection()..mergeFromMessage(this);
  RegisterConnection copyWith(void Function(RegisterConnection) updates) => super.copyWith((message) => updates(message as RegisterConnection));
  $pb.BuilderInfo get info_ => _i;
  static RegisterConnection create() => RegisterConnection();
  RegisterConnection createEmptyInstance() => create();
  static $pb.PbList<RegisterConnection> createRepeated() => $pb.PbList<RegisterConnection>();
  static RegisterConnection getDefault() => _defaultInstance ??= create()..freeze();
  static RegisterConnection _defaultInstance;

  $core.String get deviceName => $_getS(0, '');
  set deviceName($core.String v) { $_setString(0, v); }
  $core.bool hasDeviceName() => $_has(0);
  void clearDeviceName() => clearField(1);
}

class CreateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateRequest', package: const $pb.PackageName('Clippr'))
    ..aOS(1, 'content')
    ..aOS(2, 'createdBy')
    ..hasRequiredFields = false
  ;

  CreateRequest() : super();
  CreateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CreateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CreateRequest clone() => CreateRequest()..mergeFromMessage(this);
  CreateRequest copyWith(void Function(CreateRequest) updates) => super.copyWith((message) => updates(message as CreateRequest));
  $pb.BuilderInfo get info_ => _i;
  static CreateRequest create() => CreateRequest();
  CreateRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRequest> createRepeated() => $pb.PbList<CreateRequest>();
  static CreateRequest getDefault() => _defaultInstance ??= create()..freeze();
  static CreateRequest _defaultInstance;

  $core.String get content => $_getS(0, '');
  set content($core.String v) { $_setString(0, v); }
  $core.bool hasContent() => $_has(0);
  void clearContent() => clearField(1);

  $core.String get createdBy => $_getS(1, '');
  set createdBy($core.String v) { $_setString(1, v); }
  $core.bool hasCreatedBy() => $_has(1);
  void clearCreatedBy() => clearField(2);
}

class DeleteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteRequest', package: const $pb.PackageName('Clippr'))
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  DeleteRequest() : super();
  DeleteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DeleteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DeleteRequest clone() => DeleteRequest()..mergeFromMessage(this);
  DeleteRequest copyWith(void Function(DeleteRequest) updates) => super.copyWith((message) => updates(message as DeleteRequest));
  $pb.BuilderInfo get info_ => _i;
  static DeleteRequest create() => DeleteRequest();
  DeleteRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteRequest> createRepeated() => $pb.PbList<DeleteRequest>();
  static DeleteRequest getDefault() => _defaultInstance ??= create()..freeze();
  static DeleteRequest _defaultInstance;

  $core.String get id => $_getS(0, '');
  set id($core.String v) { $_setString(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);
}

class DeleteReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteReply', package: const $pb.PackageName('Clippr'))
    ..aOB(1, 'response')
    ..hasRequiredFields = false
  ;

  DeleteReply() : super();
  DeleteReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DeleteReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DeleteReply clone() => DeleteReply()..mergeFromMessage(this);
  DeleteReply copyWith(void Function(DeleteReply) updates) => super.copyWith((message) => updates(message as DeleteReply));
  $pb.BuilderInfo get info_ => _i;
  static DeleteReply create() => DeleteReply();
  DeleteReply createEmptyInstance() => create();
  static $pb.PbList<DeleteReply> createRepeated() => $pb.PbList<DeleteReply>();
  static DeleteReply getDefault() => _defaultInstance ??= create()..freeze();
  static DeleteReply _defaultInstance;

  $core.bool get response => $_get(0, false);
  set response($core.bool v) { $_setBool(0, v); }
  $core.bool hasResponse() => $_has(0);
  void clearResponse() => clearField(1);
}

class CreateReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateReply', package: const $pb.PackageName('Clippr'))
    ..aOB(1, 'response')
    ..hasRequiredFields = false
  ;

  CreateReply() : super();
  CreateReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CreateReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CreateReply clone() => CreateReply()..mergeFromMessage(this);
  CreateReply copyWith(void Function(CreateReply) updates) => super.copyWith((message) => updates(message as CreateReply));
  $pb.BuilderInfo get info_ => _i;
  static CreateReply create() => CreateReply();
  CreateReply createEmptyInstance() => create();
  static $pb.PbList<CreateReply> createRepeated() => $pb.PbList<CreateReply>();
  static CreateReply getDefault() => _defaultInstance ??= create()..freeze();
  static CreateReply _defaultInstance;

  $core.bool get response => $_get(0, false);
  set response($core.bool v) { $_setBool(0, v); }
  $core.bool hasResponse() => $_has(0);
  void clearResponse() => clearField(1);
}

class FetchRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchRequest', package: const $pb.PackageName('Clippr'))
    ..hasRequiredFields = false
  ;

  FetchRequest() : super();
  FetchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  FetchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  FetchRequest clone() => FetchRequest()..mergeFromMessage(this);
  FetchRequest copyWith(void Function(FetchRequest) updates) => super.copyWith((message) => updates(message as FetchRequest));
  $pb.BuilderInfo get info_ => _i;
  static FetchRequest create() => FetchRequest();
  FetchRequest createEmptyInstance() => create();
  static $pb.PbList<FetchRequest> createRepeated() => $pb.PbList<FetchRequest>();
  static FetchRequest getDefault() => _defaultInstance ??= create()..freeze();
  static FetchRequest _defaultInstance;
}

class FetchReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchReply', package: const $pb.PackageName('Clippr'))
    ..pc<ClipboardEntry>(1, 'clipboardEntries', $pb.PbFieldType.PM,ClipboardEntry.create)
    ..hasRequiredFields = false
  ;

  FetchReply() : super();
  FetchReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  FetchReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  FetchReply clone() => FetchReply()..mergeFromMessage(this);
  FetchReply copyWith(void Function(FetchReply) updates) => super.copyWith((message) => updates(message as FetchReply));
  $pb.BuilderInfo get info_ => _i;
  static FetchReply create() => FetchReply();
  FetchReply createEmptyInstance() => create();
  static $pb.PbList<FetchReply> createRepeated() => $pb.PbList<FetchReply>();
  static FetchReply getDefault() => _defaultInstance ??= create()..freeze();
  static FetchReply _defaultInstance;

  $core.List<ClipboardEntry> get clipboardEntries => $_getList(0);
}

class ClipboardEntryMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ClipboardEntryMessage', package: const $pb.PackageName('Clippr'))
    ..a<ClipboardEntry>(1, 'clipboardEntry', $pb.PbFieldType.OM, ClipboardEntry.getDefault, ClipboardEntry.create)
    ..e<ClipboardUpdateType>(2, 'clipboardUpdateType', $pb.PbFieldType.OE, ClipboardUpdateType.DELETED, ClipboardUpdateType.valueOf, ClipboardUpdateType.values)
    ..hasRequiredFields = false
  ;

  ClipboardEntryMessage() : super();
  ClipboardEntryMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ClipboardEntryMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ClipboardEntryMessage clone() => ClipboardEntryMessage()..mergeFromMessage(this);
  ClipboardEntryMessage copyWith(void Function(ClipboardEntryMessage) updates) => super.copyWith((message) => updates(message as ClipboardEntryMessage));
  $pb.BuilderInfo get info_ => _i;
  static ClipboardEntryMessage create() => ClipboardEntryMessage();
  ClipboardEntryMessage createEmptyInstance() => create();
  static $pb.PbList<ClipboardEntryMessage> createRepeated() => $pb.PbList<ClipboardEntryMessage>();
  static ClipboardEntryMessage getDefault() => _defaultInstance ??= create()..freeze();
  static ClipboardEntryMessage _defaultInstance;

  ClipboardEntry get clipboardEntry => $_getN(0);
  set clipboardEntry(ClipboardEntry v) { setField(1, v); }
  $core.bool hasClipboardEntry() => $_has(0);
  void clearClipboardEntry() => clearField(1);

  ClipboardUpdateType get clipboardUpdateType => $_getN(1);
  set clipboardUpdateType(ClipboardUpdateType v) { setField(2, v); }
  $core.bool hasClipboardUpdateType() => $_has(1);
  void clearClipboardUpdateType() => clearField(2);
}

class ClipboardEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ClipboardEntry', package: const $pb.PackageName('Clippr'))
    ..aOS(1, 'id')
    ..aOS(2, 'createdAt')
    ..aOS(3, 'content')
    ..aOS(4, 'createdBy')
    ..hasRequiredFields = false
  ;

  ClipboardEntry() : super();
  ClipboardEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ClipboardEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ClipboardEntry clone() => ClipboardEntry()..mergeFromMessage(this);
  ClipboardEntry copyWith(void Function(ClipboardEntry) updates) => super.copyWith((message) => updates(message as ClipboardEntry));
  $pb.BuilderInfo get info_ => _i;
  static ClipboardEntry create() => ClipboardEntry();
  ClipboardEntry createEmptyInstance() => create();
  static $pb.PbList<ClipboardEntry> createRepeated() => $pb.PbList<ClipboardEntry>();
  static ClipboardEntry getDefault() => _defaultInstance ??= create()..freeze();
  static ClipboardEntry _defaultInstance;

  $core.String get id => $_getS(0, '');
  set id($core.String v) { $_setString(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $core.String get createdAt => $_getS(1, '');
  set createdAt($core.String v) { $_setString(1, v); }
  $core.bool hasCreatedAt() => $_has(1);
  void clearCreatedAt() => clearField(2);

  $core.String get content => $_getS(2, '');
  set content($core.String v) { $_setString(2, v); }
  $core.bool hasContent() => $_has(2);
  void clearContent() => clearField(3);

  $core.String get createdBy => $_getS(3, '');
  set createdBy($core.String v) { $_setString(3, v); }
  $core.bool hasCreatedBy() => $_has(3);
  void clearCreatedBy() => clearField(4);
}

