import 'package:dio/dio.dart';

import '../../core/error/error_mesage.dart';
import '../../core/error/exception.dart';
import '../../utils/string_manager.dart';
import '../model/list_api_model.dart';

abstract class BaseListRemoteDataSource {
  Future<List<ListApiModel>> getListDatasourse();
}

class ListRemoteDataSource implements BaseListRemoteDataSource {
  @override
  Future<List<ListApiModel>> getListDatasourse() async {
    final response = await Dio().get(AppString.apiPath);
    if (response.statusCode == 200) {

      return List<ListApiModel>.from((response.data['products'] as List)
          .map((e) =>  ListApiModel.fromJson(e)));

    } else {

      throw ServerExcepion(errorMasage: ErrorMasage.fromJson(response.data),

      );
    }
  }

}
