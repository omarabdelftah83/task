import 'package:get_it/get_it.dart';

import '../../data/data_souce/data_source_list.dart';
import '../../data/repostiry/list_repository.dart';
import '../../domain/repositry/base_list_repo.dart';
import '../../domain/usecase/get_list_useCase.dart';
import '../../presention/controller/list_bloc.dart';

GetIt serLoc = GetIt.instance;
class ServiesLcator{
  void init(){
    ////REmoteDataSourse
    serLoc.registerLazySingleton<BaseListRemoteDataSource>(() => ListRemoteDataSource());

    ////BaseRepostry
    serLoc.registerLazySingleton<BaseListRepository>(() => ListRepository(serLoc()));

    ////UseCase
    serLoc.registerLazySingleton(() =>GetListUseCase(serLoc()));
    /////////Ingection with the bloc
    serLoc.registerFactory(() => ListBlock(serLoc(),));
  }}