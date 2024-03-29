
import 'package:equatable/equatable.dart';
import '../../../domain/entites/list.dart';
import '../../../utils/enum.dart';


class ListState extends Equatable{

  //State//

  final List<ListApi> nowPlayingList;
  final RequastStat nowPlayingState;
  final String masege;



  //constructor//
  ListState({
    this.nowPlayingList=const[],
    this.nowPlayingState=RequastStat.loading,
    this.masege='',

  });
  //copywith//

  ListState Copywith({

    List<ListApi>? nowPlayingList,
    RequastStat? nowPlayingState,
    String? masege,


  }){
    return ListState(
      nowPlayingList: nowPlayingList??this.nowPlayingList,
      nowPlayingState: nowPlayingState??this.nowPlayingState,
      masege: masege??this.masege,



    );
  }
  @override
  // TODO: implement props
  //equtable//
  List<Object?> get props => [
    nowPlayingList,
    nowPlayingState,
    masege,


  ];


}

