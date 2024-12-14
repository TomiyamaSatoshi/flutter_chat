import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'personal.freezed.dart';

part 'personal.g.dart';

@freezed
class Personal with _$Personal {
  factory Personal({
    required int id,
    required String name,
    required int age,
    required String sex,
    required String birthday,
    required String occupation,
  }) = _Personal;

  factory Personal.fromJson(Map<String, dynamic> json) =>
      _$PersonalFromJson(json);
}
