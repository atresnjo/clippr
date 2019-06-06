import 'dart:async';
import 'package:clippr/services/clipboard_service.dart';
import 'package:clippr/services/config_service.dart';
import 'package:clippr/utils/injector.dart';
import 'package:flutter/services.dart';

class ClipboardTimer {
  Timer clipboardTriggerTime;
  String lastClipboardContent;
  ConfigService _configService = ConfigService();

  void start() {
    print("started");
    clipboardTriggerTime = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_configService.synchronizeClipboard) {
          Clipboard.getData('text/plain').then((clipboarContent) {
            if (lastClipboardContent == clipboarContent.text) return;
            var service = injector.get<ClipboardService>();
            service.createClipboardEntry(clipboarContent.text);
            lastClipboardContent = clipboarContent.text;
          });
        }
      },
    );
  }

  void stop() {
    clipboardTriggerTime.cancel();
  }
}
