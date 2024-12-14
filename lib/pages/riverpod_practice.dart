import 'package:flutter/material.dart';
import 'package:flutter_chat/widgets/common_drawer.dart';
import 'package:flutter_chat/widgets/counter_widget.dart';
import 'package:flutter_chat/widgets/list_data_widget.dart';
import 'package:flutter_chat/widgets/stream_data_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/async_value_widget.dart';

class RiverpodPractice extends ConsumerWidget {
  const RiverpodPractice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piverpod Practice'),
      ),
      drawer: const CommonDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CounterWidget(),
            ListDataWidget(),
            AsyncValueWidget(),
            StreamDataWidget(),
          ],
        ),
      ),
    );
  }
}
