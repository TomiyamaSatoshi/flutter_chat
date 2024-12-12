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
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              ),
            ),
            columns: const <DataColumn>[
              DataColumn(
                label: Text('Name'),
              ),
              DataColumn(
                label: Text('Age'),
              ),
              DataColumn(
                label: Text('Sex'),
              ),
              DataColumn(
                label: Text('Birthday'),
              ),
              DataColumn(
                label: Text('Occupation'),
              ),
            ],
            rows: List<DataRow>.generate(
              personalList.length,
              (index) => DataRow(
                cells: [
                  DataCell(Text(personalList[index].name)),
                  DataCell(Text(personalList[index].age.toString())),
                  DataCell(Text(personalList[index].sex)),
                  DataCell(Text(personalList[index].birthday)),
                  DataCell(Text(personalList[index].occupation)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
