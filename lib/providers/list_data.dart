import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_data.g.dart';

@riverpod
class ListData extends _$ListData {
  @override
  List<String> build() {
    return ['init data'];
  }

  void incrementListData() {
    state = [...state, '追加データ'];
    print(state);
  }
}
