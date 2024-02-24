import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/list_api_model.dart';
import '../../../../domain/entites/list.dart';
import '../../../controller/search/seach_bloc.dart';
import '../../../controller/search/search_state.dart';

class ItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchLoaded) {

          if(state.searchResult.isEmpty){
            return const Center(child: Text("Not Foud"),);
          }else{
            return ListView.builder(
              itemCount: state.searchResult.length,
              itemBuilder: (BuildContext context, int index) {

                return Card(
                  child: ListTile(
                    title: Text(
                      state.searchResult[index].title??'',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text( state.searchResult[index].description??''),
                    trailing: Text('\$${state.searchResult[index].price.toStringAsFixed(2)}'),
                  ),
                );
              },
            );
          }


        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
