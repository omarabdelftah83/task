import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presention/controller/list_bloc.dart';
import 'package:task/presention/controller/list_event.dart';
import 'package:task/presention/controller/list_state.dart';

import '../../core/servies/servies_locator.dart';
import '../../utils/enum.dart';
import '../../utils/string_manager.dart';
import 'change_language.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.home).tr(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'search',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
              // Implement your search functionality here
              onChanged: (value) {
                // Perform search based on the entered value
              },
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (BuildContext context) => serLoc<ListBlock>()..add(ListEvent()),
              child: BlocBuilder<ListBlock, ListState>(
                builder: (context, state) {
                  if (state.nowPlayingState == RequastStat.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.nowPlayingState == RequastStat.loaded) {
                    return ListView.builder(
                      itemCount: state.nowPlayingList.length,
                      itemBuilder: (context, index) {
                        final item = state.nowPlayingList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.grey[50],
                            elevation: 7,
                            child: ListTile(
                              title: Text(item.title),
                              subtitle: Text(item.description),
                              onTap: () {
                                // Perform any action needed when the item is tapped
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state.nowPlayingState == RequastStat.error) {
                    return const Center(
                      child: Text(''),
                    );
                  } else {
                    // Handle other states here
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 20), // يمكنك تعديل الارتفاع حسب الحاجة
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LanguageScreen()),
              );
            },
            child: const Text(AppString.goto),
          ),
        ],
      ),
    );
  }
}



