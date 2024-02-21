import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entites/list.dart';
import '../../domain/usecase/get_list_useCase.dart';
import '../../utils/enum.dart';
import 'list_event.dart';
import 'list_state.dart';

class ListBlock extends Bloc<BaseEvent, ListState> {
  final GetListUseCase getListUseCase;

  ListBlock(this.getListUseCase) : super(ListState()) {
    //////event..1
    on<ListEvent>((event, emit) async {
      final re = await getListUseCase.exeute();

      re.fold(
          (l) => emit(state.Copywith(
                nowPlayingState: RequastStat.error,
                masege: 'error',
              )),
          (r) => emit(state.Copywith(
              nowPlayingList: r, nowPlayingState: RequastStat.loaded)));
    });



  }
}


