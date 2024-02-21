import 'package:dartz/dartz.dart';
import '../../core/error/faluire.dart';
import '../entites/list.dart';

abstract class BaseListRepository{

  Future<Either< Faluiare,List<ListApi>>> getListRepo();


}