import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stream_data.g.dart';

@riverpod
class StreamData extends _$StreamData {
  @override
  Stream<String> build() {
    // 1秒ごとに通知を受け取る stream
    final controller = StreamController<String>();
    const sec1 = Duration(seconds: 1);
    final timer = Timer.periodic(sec1, (t) {
      controller.add('メッセージが${t.tick}件届きました');
    });
    // 4秒後にストップ
    const sec4 = Duration(seconds: 4);
    Future.delayed(sec4, () {
      timer.cancel();
      controller.sink.close();
    });
    return controller.stream;
  }

  void updateStreamData() async {
    const sec = Duration(seconds: 1);
    await Future.delayed(sec);
    state = const AsyncValue.data('メッセージが５件届きました');
    await Future.delayed(sec);
    state = const AsyncValue.data('メッセージが１０件届きました');
  }
}
