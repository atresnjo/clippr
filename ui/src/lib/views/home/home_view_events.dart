import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeViewEvent extends Equatable {
  HomeViewEvent([List props = const []]) : super(props);
}

class FetchClipboardEntities extends HomeViewEvent {
  FetchClipboardEntities();

  @override
  String toString() => 'FetchClipboardEntities fired}';
}

class CreateClipboardEntry extends HomeViewEvent {
  final String content;

  CreateClipboardEntry({
    @required this.content,
  }) : super([content]);

  @override
  String toString() => 'CreateClipboardEntry fired with content $content }';
}

class DeleteClipboardEntry extends HomeViewEvent {
  final String id;

  DeleteClipboardEntry({
    @required this.id,
  }) : super([id]);

  @override
  String toString() => 'DeleteClipboardEntry fired with id $id }';
}
