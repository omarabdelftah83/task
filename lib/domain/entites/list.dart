import 'package:equatable/equatable.dart';

class ListApi extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final String brand;
  final String category;

  ListApi(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.brand,
      required this.category});

  @override
  //TODO: implement props
  List<Object?> get props =>
      [id, title, description, price, discountPercentage, brand, category];
}

