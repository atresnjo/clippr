import 'package:clippr/events/search_filter_updated_event.dart';
import 'package:clippr/generated/clipboard.pbgrpc.dart';
import 'package:event_bus/event_bus.dart';
import 'package:clippr/events/events.dart';
import 'clipboard_deleted_event.dart';

class EventHandler {
  final EventBus eventBus = new EventBus();

  void clipboardEntryCreatedEvent(ClipboardEntry entry) {
    eventBus.fire(new ClipboardCreatedEvent(entry));
  }

  void clipboardEntryDeletedEvent(ClipboardEntry entry) {
    eventBus.fire(new ClipboardDeletedEvent(entry));
  }

  void searchFilterUpdatedEvent(String filter) {
    eventBus.fire(new SearchFilterUpdatedEvent(filter));
  }
}
