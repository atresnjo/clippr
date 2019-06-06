import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clippr/generated/clipboard.pb.dart';
import 'package:clippr/services/clipboard_service.dart';
import 'package:clippr/utils/injector.dart';
import 'package:rxdart/rxdart.dart';
import 'home.dart';
import 'package:clippr/events/events.dart';

class HomeViewBloc extends Bloc<HomeViewEvent, HomeViewState> {
  EventHandler _eventHandler;
  final List<ClipboardEntry> _clipboardEntries = List<ClipboardEntry>();
  final _clipboardEntriesSubject = BehaviorSubject<List<ClipboardEntry>>();
  Stream<List<ClipboardEntry>> get clipboardEntriesStream =>
      _clipboardEntriesSubject.stream;

  StreamSubscription _clipboardCreated;
  StreamSubscription _clipboardDeleted;
  StreamSubscription _searchFilterUpdated;

  HomeViewBloc() {
    _eventHandler = injector.get<EventHandler>();
    _clipboardCreated =
        _eventHandler.eventBus.on<ClipboardCreatedEvent>().listen((event) {
      _handleClipboardCreated(event);
    });
    _clipboardDeleted =
        _eventHandler.eventBus.on<ClipboardDeletedEvent>().listen((event) {
      _handleClipboardDeleted(event);
    });

    _searchFilterUpdated =
        _eventHandler.eventBus.on<SearchFilterUpdatedEvent>().listen((event) {
      _handleSearchFilterUpdated(event);
    });
  }

  void _handleSearchFilterUpdated(SearchFilterUpdatedEvent filterUpdated) {
    if (filterUpdated.filterText.isEmpty) {
      this.dispatch(FetchClipboardEntities());
    }
    _clipboardEntries.removeWhere((entry) => !entry.content
        .toLowerCase()
        .contains(filterUpdated.filterText.toLowerCase()));

    _clipboardEntriesSubject.add(_clipboardEntries);
  }

  void _handleClipboardCreated(ClipboardCreatedEvent clipboardCreatedEvent) {
    _clipboardEntries.insert(0, clipboardCreatedEvent.clipboardEntry);
    _clipboardEntriesSubject.add(_clipboardEntries);
  }

  void _handleClipboardDeleted(ClipboardDeletedEvent clipboardDeletedEvent) {
    _clipboardEntries.removeWhere(
        (entry) => entry.id == clipboardDeletedEvent.clipboardEntry.id);
    _clipboardEntriesSubject.add(_clipboardEntries);
  }

  @override
  HomeViewState get initialState => InitialView();

  @override
  Stream<HomeViewState> mapEventToState(HomeViewEvent event) async* {
    var clipboardService = injector.get<ClipboardService>();

    if (event is CreateClipboardEntry) {
      try {
        await clipboardService.createClipboardEntry(event.content);
      } catch (err) {
        print("Error while creating clipboard entry: $err");
      }
    } else if (event is DeleteClipboardEntry) {
      try {
        var response = await clipboardService.deleteClipboardEntry(event.id);
        if (response) {
          _clipboardEntries.removeWhere((entry) => entry.id == event.id);
          _clipboardEntriesSubject.add(_clipboardEntries);
        }
      } catch (err) {
        print("Error while deleting clipboard entry: $err");
      }
    } else if (event is FetchClipboardEntities) {
      try {
        yield ClipboardFetching();
        var result = await clipboardService.fetchClipboardEntries();
        _clipboardEntries.clear();
        _clipboardEntriesSubject.add(_clipboardEntries);
        _clipboardEntries.addAll(result);
        _clipboardEntriesSubject.add(_clipboardEntries);
      } catch (err) {} finally {
        yield ClipboardFetched();
      }
    }
  }

  @override
  void dispose() {
    _searchFilterUpdated.cancel();
    _clipboardDeleted.cancel();
    _clipboardCreated.cancel();
    _clipboardEntriesSubject.close();
    super.dispose();
  }
}
