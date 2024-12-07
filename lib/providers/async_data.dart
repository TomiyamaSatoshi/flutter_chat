import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_data.g.dart';

@riverpod
class AsyncData extends _$AsyncData {
  @override
  Future<String> build() async {
    const sec = Duration(seconds: 3);
    await Future.delayed(sec);
    return 'init data';
  }

  void updateAsyncData() async {
    state = const AsyncValue.loading();
    const sec = Duration(seconds: 3);
    await Future.delayed(sec);
    state = const AsyncValue.data('updated data');
  }
}
