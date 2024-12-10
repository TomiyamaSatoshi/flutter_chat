import 'package:flutter/material.dart';
import 'package:flutter_chat/models/personal.dart';
import 'package:flutter_chat/providers/personal_data.dart';
import 'package:flutter_chat/widgets/common_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FreezedJsonPractice extends ConsumerWidget {
  const FreezedJsonPractice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(personalDataProvider);
    List<Personal> personalList = state.when(
      loading: () => [],
      error: (e, s) => [],
      data: (d) => d,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('FreezedJsonPractice'),
      ),
      drawer: const CommonDrawer(),
      body: ListView.builder(
        itemCount: personalList.length,
        itemBuilder: (_, int index) {
          return Row(
            children: [
              Text(personalList[index].name),
              Text(personalList[index].age.toString()),
              Text(personalList[index].sex),
              Text(personalList[index].birthday),
              Text(personalList[index].occupation),
            ],
          );
        },
      ),
    );
  }
}
