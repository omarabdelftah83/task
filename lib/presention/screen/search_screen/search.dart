import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/servies/servies_locator.dart';
import '../../controller/search/seach_bloc.dart';
import '../../controller/search/search_state.dart';
import 'widgets/Item_list.dart';
import '../../widget/custom_search.dart';

class Search extends StatelessWidget {
  final TextEditingController searchTextController = TextEditingController();
  final cubet = serLoc<SearchCubit>();

  @override
  Widget build(BuildContext context) {
    cubet.getData();

    return BlocProvider(
      create: (context) => cubet,
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            backgroundColor: Colors.white,
            body: LayoutBuilder(builder: (context, size) {
              return SizedBox(
                width: size.maxWidth > 500 ? 400 : 400,
                height: size.maxHeight > 700 ? 600 : 500,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    CustomSearchField(
                        searchTextController: searchTextController),
                    SizedBox(
                      height: 50,
                      child: Container(
                        decoration: const BoxDecoration(
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
                    Expanded(child: ItemsList()),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
