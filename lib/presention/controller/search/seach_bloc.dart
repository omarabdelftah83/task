import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/servies/servies_locator.dart';
import 'package:task/presention/controller/search/search_state.dart';
import '../../../domain/entites/list.dart';
import '../../../domain/usecase/get_list_useCase.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetListUseCase getListUseCase;
  List<ListApi>? searchList;
  List<ListApi>? totalItems;
  SearchCubit(this.getListUseCase) : super(SearchInitial());


  getData() async {
    emit(SearchLoading());
    final re = await getListUseCase.exeute();
    re.fold((l) {
      emit(SearchError(errorMessage: l.massege));
    }, (r) {
      searchList = r;
      emit(SearchLoaded(searchList ?? []));
    });
  }

  void search(String searchQuery) {
    /////الحروف متماثله
    final query = searchQuery.toString().toLowerCase().trim();
    if (query.isNotEmpty) {
     // emit(SearchLoading());
      List<ListApi> search = [];

      searchList?.forEach((element) {
        if (element.title.toString().toLowerCase().contains(query) ||
            element.price.toString().toLowerCase().contains(query)) {
          search.add(element);
        }
      });

      emit(SearchLoaded(search));
    } else {
      emit(SearchLoaded(searchList ?? []));
    }
  }
}
