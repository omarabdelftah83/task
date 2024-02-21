import 'package:task/domain/entites/list.dart';

class ListApiModel extends ListApi {
  ListApiModel({
    required int id,
    required String title,
    required String description,
    required double price, // تغيير النوع إلى double
    required double discountPercentage, // تغيير النوع إلى double
    required String brand,
    required String category,
  }) : super(
    id: id,
    title: title,
    description: description,
    price: price,
    discountPercentage: discountPercentage,
    brand: brand,
    category: category,
  );

  factory ListApiModel.fromJson(Map<String, dynamic> json) {
    return ListApiModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(), // تحويل القيمة من `num` (سواء كانت `int` أو `double`) إلى `double`
      discountPercentage: (json['discountPercentage'] as num)
          .toDouble(), // تحويل القيمة من `num` (سواء كانت `int` أو `double`) إلى `double`
      brand: json['brand'] as String,
      category: json['category'] as String,
    );
  }
}
class ItemApi extends Item {
  ItemApi({
    required int id,
    required String title,
    required String description,
    required double price, // تغيير النوع إلى double
    required double discountPercentage, // تغيير النوع إلى double
    required String brand,
    required String category,
  }) : super(
    id: id,
    title: title,
    description: description,
    price: price,
    discountPercentage: discountPercentage,
    brand: brand,
    category: category,
  );

  factory ItemApi.fromJson(Map<String, dynamic> json) {
    return ItemApi(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(), // تحويل القيمة من `num` (سواء كانت `int` أو `double`) إلى `double`
      discountPercentage: (json['discountPercentage'] as num)
          .toDouble(), // تحويل القيمة من `num` (سواء كانت `int` أو `double`) إلى `double`
      brand: json['brand'] as String,
      category: json['category'] as String,
    );
  }
}