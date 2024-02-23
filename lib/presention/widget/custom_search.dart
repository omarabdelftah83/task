import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/search/seach_bloc.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController searchTextController;

  const CustomSearchField({Key? key, required this.searchTextController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: searchTextController,
        onChanged: (txt) {
          final searchCubit = context.read<SearchCubit>(); // Read the SearchCubit
          final totalItems = searchCubit.state.totalItems; // Extract totalItems from SearchState
          searchCubit.search(txt,); // Pass both searchQuery and totalItems to search method
        },
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.search),
          hintText: 'Search',
          contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 3.1, color: Colors.red),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
