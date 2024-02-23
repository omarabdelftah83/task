import 'package:equatable/equatable.dart';

abstract class BaseEvent extends Equatable {
  const BaseEvent();
  @override
  List<Object> get props => [];
}

class ListEvent extends BaseEvent {}

class SearchEvent extends BaseEvent {
  final String searchTerm;

  const SearchEvent(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}

