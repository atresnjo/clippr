///
//  Generated code. Do not modify.
//  source: clipboard.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;

import 'dart:core' as $core show int, String, List;

import 'clipboard.pb.dart';
export 'clipboard.pb.dart';

class ClipboardClient extends $grpc.Client {
  static final _$fetch = $grpc.ClientMethod<FetchRequest, FetchReply>(
      '/Clippr.Clipboard/Fetch',
      (FetchRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => FetchReply.fromBuffer(value));
  static final _$create = $grpc.ClientMethod<CreateRequest, CreateReply>(
      '/Clippr.Clipboard/Create',
      (CreateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => CreateReply.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<DeleteRequest, DeleteReply>(
      '/Clippr.Clipboard/Delete',
      (DeleteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => DeleteReply.fromBuffer(value));
  static final _$clipboardUpdate =
      $grpc.ClientMethod<RegisterConnection, ClipboardEntryMessage>(
          '/Clippr.Clipboard/ClipboardUpdate',
          (RegisterConnection value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              ClipboardEntryMessage.fromBuffer(value));

  ClipboardClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<FetchReply> fetch(FetchRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$fetch, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<CreateReply> create(CreateRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$create, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<DeleteReply> delete(DeleteRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$delete, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<ClipboardEntryMessage> clipboardUpdate(
      RegisterConnection request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$clipboardUpdate, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class ClipboardServiceBase extends $grpc.Service {
  $core.String get $name => 'Clippr.Clipboard';

  ClipboardServiceBase() {
    $addMethod($grpc.ServiceMethod<FetchRequest, FetchReply>(
        'Fetch',
        fetch_Pre,
        false,
        false,
        ($core.List<$core.int> value) => FetchRequest.fromBuffer(value),
        (FetchReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<CreateRequest, CreateReply>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => CreateRequest.fromBuffer(value),
        (CreateReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<DeleteRequest, DeleteReply>(
        'Delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => DeleteRequest.fromBuffer(value),
        (DeleteReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<RegisterConnection, ClipboardEntryMessage>(
        'ClipboardUpdate',
        clipboardUpdate_Pre,
        false,
        true,
        ($core.List<$core.int> value) => RegisterConnection.fromBuffer(value),
        (ClipboardEntryMessage value) => value.writeToBuffer()));
  }

  $async.Future<FetchReply> fetch_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return fetch(call, await request);
  }

  $async.Future<CreateReply> create_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return create(call, await request);
  }

  $async.Future<DeleteReply> delete_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return delete(call, await request);
  }

  $async.Stream<ClipboardEntryMessage> clipboardUpdate_Pre(
      $grpc.ServiceCall call, $async.Future request) async* {
    yield* clipboardUpdate(call, (await request) as RegisterConnection);
  }

  $async.Future<FetchReply> fetch($grpc.ServiceCall call, FetchRequest request);
  $async.Future<CreateReply> create(
      $grpc.ServiceCall call, CreateRequest request);
  $async.Future<DeleteReply> delete(
      $grpc.ServiceCall call, DeleteRequest request);
  $async.Stream<ClipboardEntryMessage> clipboardUpdate(
      $grpc.ServiceCall call, RegisterConnection request);
}
