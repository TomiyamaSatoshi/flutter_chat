import 'package:flutter/material.dart';
import 'package:flutter_chat/providers/async_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget extends ConsumerWidget {
  const AsyncValueWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateFuture = ref.watch(asyncDataProvider);
    final state = stateFuture.when(
      loading: () => const CircularProgressIndicator(),
      error: (e, s) => Text('エラー:${e}'),
      data: (d) => Text(d),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('Async Data'),
          subtitle: Center(
            child: ElevatedButton(
              onPressed: () {
                final notifier = ref.read(asyncDataProvider.notifier);
                notifier.updateAsyncData();
              },
              child: const Text('データ問い合わせ'),
            ),
          ),
        ),
        Center(
          child: state,
        )
      ],
    );
  }
}
