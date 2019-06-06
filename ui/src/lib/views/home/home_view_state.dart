import 'package:equatable/equatable.dart';

abstract class HomeViewState extends Equatable {
  HomeViewState([List props = const []]) : super(props);
}

class InitialView extends HomeViewState {
  @override
  String toString() => "InitialView";
}

class ClipboardFetching extends HomeViewState {
  @override
  String toString() => 'ClipboardFetching';
}

class ClipboardFetched extends HomeViewState {
  @override
  String toString() => 'ClipboardFetched';
}