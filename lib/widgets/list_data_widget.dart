import 'package:flutter/material.dart';
import 'package:flutter_chat/providers/list_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListDataWidget extends ConsumerWidget {
  const ListDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listDataProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('Multiple Data'),
          subtitle: Center(
            child: ElevatedButton(
              onPressed: () {
                final notifier = ref.read(listDataProvider.notifier);
                notifier.incrementListData();
              },
              child: const Text('データを追加する'),
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
              itemCount: state.length,
              itemBuilder: (_, index) {
                return Card(
                  child: Text(state[index] + '${index}'),
                );
              }),
        ),
      ],
    );
  }
}
