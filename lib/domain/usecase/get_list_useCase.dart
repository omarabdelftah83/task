import 'package:dartz/dartz.dart';
import 'package:task/domain/repositry/base_list_repo.dart';

import '../../core/error/faluire.dart';
import '../entites/list.dart';

class GetListUseCase{
  BaseListRepository baseListRepository;
  GetListUseCase(this.baseListRepository);
  Future<Either< Faluiare,List<ListApi>>> exeute()async{
    return await baseListRepository.getListRepo();
  }
}