import 'package:flutter/material.dart';
import 'package:flutter_chat/providers/counter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int state = ref.watch(counterProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: ListTile(
        title: const Text('Simple Data'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '$state',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    final notifier = ref.read(counterProvider.notifier);
                    notifier.resetCounter();
                  },
                  icon: const Icon(Icons.exposure_zero),
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    final notifier = ref.read(counterProvider.notifier);
                    notifier.incrementCounter();
                  },
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    final notifier = ref.read(counterProvider.notifier);
                    notifier.decrementCounter();
                  },
                  icon: const Icon(Icons.remove),
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
