import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/servies/servies_locator.dart';
import 'package:task/presention/controller/search/search_state.dart';
import '../../../domain/entites/list.dart';
import '../../../domain/usecase/get_list_useCase.dart';

class SearchCubit extends Cubit<SearchState> {

  List<ListApi>? searchList;
  List<ListApi>? totalItems;
  SearchCubit() : super(SearchInitial());

  final homeUseCase = serLoc<GetListUseCase>();

  getData() async {
    emit(SearchLoading());
    final re = await homeUseCase.exeute();

    re.fold((l) {
      emit(SearchError(errorMessage: l.massege));
    }, (r) {
      searchList = r;
      emit(SearchLoaded(searchList??[]));
    });

    log("searchList ${searchList?.length}");
  }


  void search(String searchQuery) {
      final query= searchQuery.toString().toLowerCase().trim();
      if(query.isNotEmpty){
        emit(SearchLoading());
        List<ListApi> search=[];
     //   final resuletList = searchList?.where((element) => element==query).toList();
        searchList?.forEach((element) {
            if(element.title.toString().toLowerCase().contains(query)||element.price.toString().toLowerCase().contains(query))
            {
              search.add(element);
            }
        });

        emit(SearchLoaded(search));
        log("click here 2${search.length}");
      }else{
        emit(SearchLoaded(searchList??[]));
      }

  }
}


