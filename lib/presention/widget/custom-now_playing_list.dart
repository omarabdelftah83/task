import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/servies/servies_locator.dart';
import '../../utils/enum.dart';
import '../controller/home/list_bloc.dart';
import '../controller/home/list_event.dart';
import '../controller/home/list_state.dart';

class NowPlayingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
                        // Handle item tap here
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
    );
  }
}