import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class UserModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final String brand;
  final String category;

  const UserModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.brand,
    required this.category,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      brand: json['brand'] as String,
      category: json['category'] as String,
    );
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late List<UserModel> totalItems = [];
  late List<UserModel> searchResult = [];
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final url = 'https://dummyjson.com/products?limit=50&skip=0';
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data['products'];
        if (data != null && data is List) {
          totalItems = data
              .map((itemJson) => UserModel.fromJson(itemJson))
              .toList();
          setState(() {});
          // Print data to console
          print(totalItems);
        } else {
          print('Data format is not as expected');
        }
      }
    } catch (e) {
      print("Error fetching items: $e");
    }
  }

  void search(String searchQuery) {
    setState(() {
      searchResult.clear();
      if (searchQuery.isEmpty) {
        searchResult.addAll(totalItems);
      } else {
        totalItems.forEach((item) {
          if (item.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
              item.description.toLowerCase().contains(searchQuery.toLowerCase())) {
            searchResult.add(item);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) => search(text),
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  border: OutlineInputBorder(
                    borderSide:
                    const BorderSide(width: 3.1, color: Colors.red),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.green),
                  ),
                ),
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  'Items',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Expanded(child: itemsWidget()),
          ],
        ),
      ),
    );
  }

  Widget itemsWidget() {
    final List<UserModel> itemsToShow =
    searchResult.isNotEmpty ? searchResult : totalItems;
    return ListView.builder(
      itemCount: itemsToShow.length,
      itemBuilder: (BuildContext context, int index) {
        final UserModel item = itemsToShow[index];
        return Card(
          child: ListTile(
            title: Text(
              item.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(item.description),
            trailing: Text('\$${item.price.toStringAsFixed(2)}'),
          ),
        );
      },
    );
  }
}


