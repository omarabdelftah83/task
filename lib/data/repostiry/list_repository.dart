import 'package:dartz/dartz.dart';

import 'package:task/core/error/faluire.dart';
import 'package:task/data/data_souce/data_source_list.dart';

import 'package:task/domain/entites/list.dart';

import '../../core/error/exception.dart';
import '../../domain/repositry/base_list_repo.dart';

class ListRepository implements BaseListRepository{
  final BaseListRemoteDataSource baseListRemoteDataSource;
  ListRepository(this.baseListRemoteDataSource);
  @override
  Future<Either<Faluiare, List<ListApi>>> getListRepo()async {
    final result= await  baseListRemoteDataSource.getListDatasourse();

    try{
      return right(result);
    }
    on ServerExcepion catch (faluaire){
      left(ServerFaluiare(faluaire.errorMasage.stutesMassage));

      throw UnimplementedError();
    }
  }
}