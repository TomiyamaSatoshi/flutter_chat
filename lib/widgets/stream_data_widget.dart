import 'package:flutter/material.dart';
import 'package:flutter_chat/providers/stream_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamDataWidget extends ConsumerWidget {
  const StreamDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateStream = ref.watch(streamDataProvider);
    final state = stateStream.when(
      loading: () => const CircularProgressIndicator(),
      error: (e, s) => Text('エラー:${e}'),
      data: (d) => Text(d),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('Stream Data'),
          subtitle: Center(
            child: ElevatedButton(
              onPressed: () {
                final notifier = ref.read(streamDataProvider.notifier);
                notifier.updateStreamData();
              },
              child: const Text('Streamデータを受信する'),
            ),
          ),
        ),
        Center(
          child: state,
        ),
      ],
    );
  }
}
