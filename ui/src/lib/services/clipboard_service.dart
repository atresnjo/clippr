import 'dart:async';
import 'dart:io';
import 'package:clippr/events/event_handler.dart';
import 'package:clippr/generated/clipboard.pbgrpc.dart';
import 'package:clippr/services/config_service.dart';
import 'package:clippr/utils/injector.dart';
import 'package:grpc/grpc.dart';

class ClipboardService {
  ClipboardClient _client;
  final ConfigService _configService = ConfigService();
  EventHandler _eventHandler;

  ClipboardService() {
    _eventHandler = injector.get<EventHandler>();

    final channel = new ClientChannel(_configService.endpointHost,
        port: 1337,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));

    _client = new ClipboardClient(channel);
    _receiveClipboardUpdates();
  }

  Future<bool> createClipboardEntry(String content) async {
    var request = new CreateRequest()
      ..content = content
      ..createdBy = _configService.deviceName;

    var response = await _client.create(request,
        options: CallOptions(timeout: Duration(seconds: 5)));
    return response.response;
  }

  Future<List<ClipboardEntry>> fetchClipboardEntries({int count = 0}) async {
    var request = new FetchRequest();
    var response = await _client.fetch(request);
    return response.clipboardEntries;
  }

  Future<bool> deleteClipboardEntry(String id) async {
    var request = new DeleteRequest()..id = id;
    var response = await _client.delete(request);
    return response.response;
  }

  void _receiveClipboardUpdates() async {
    do {
      try {
        var request = new RegisterConnection()
          ..deviceName = _configService.deviceName;
        var stream = _client.clipboardUpdate(request);
        await for (var message in stream) {
          if (message.clipboardUpdateType == ClipboardUpdateType.CREATED) {
            _eventHandler.clipboardEntryCreatedEvent(message.clipboardEntry);
          } else if (message.clipboardUpdateType ==
              ClipboardUpdateType.DELETED) {
            _eventHandler.clipboardEntryDeletedEvent(message.clipboardEntry);
          }
        }

        sleep(Duration(seconds: 1));
      } catch (error) {
        print("errors $error");
        break;
      }
    } while (true);
  }
}
