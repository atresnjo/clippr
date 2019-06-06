import 'package:clippr/generated/clipboard.pb.dart';

class ClipboardCreatedEvent {
  ClipboardEntry clipboardEntry;
  ClipboardCreatedEvent(this.clipboardEntry);
}
