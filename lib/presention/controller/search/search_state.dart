import '../../../data/model/list_api_model.dart';
import '../../../domain/entites/list.dart';

 abstract class SearchState {
  get totalItems => null;
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  List<ListApi> searchResult;
  SearchLoaded(this.searchResult);
}

class SearchError extends SearchState {
   final String? errorMessage;
   SearchError({this.errorMessage});
}

