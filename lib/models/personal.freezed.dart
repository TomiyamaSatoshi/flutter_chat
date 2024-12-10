// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Personal _$PersonalFromJson(Map<String, dynamic> json) {
  return _Personal.fromJson(json);
}

/// @nodoc
mixin _$Personal {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  String get birthday => throw _privateConstructorUsedError;
  String get occupation => throw _privateConstructorUsedError;

  /// Serializes this Personal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Personal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalCopyWith<Personal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalCopyWith<$Res> {
  factory $PersonalCopyWith(Personal value, $Res Function(Personal) then) =
      _$PersonalCopyWithImpl<$Res, Personal>;
  @useResult
  $Res call(
      {int id,
      String name,
      int age,
      String sex,
      String birthday,
      String occupation});
}

/// @nodoc
class _$PersonalCopyWithImpl<$Res, $Val extends Personal>
    implements $PersonalCopyWith<$Res> {
  _$PersonalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Personal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = null,
    Object? sex = null,
    Object? birthday = null,
    Object? occupation = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: null == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalImplCopyWith<$Res>
    implements $PersonalCopyWith<$Res> {
  factory _$$PersonalImplCopyWith(
          _$PersonalImpl value, $Res Function(_$PersonalImpl) then) =
      __$$PersonalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int age,
      String sex,
      String birthday,
      String occupation});
}

/// @nodoc
class __$$PersonalImplCopyWithImpl<$Res>
    extends _$PersonalCopyWithImpl<$Res, _$PersonalImpl>
    implements _$$PersonalImplCopyWith<$Res> {
  __$$PersonalImplCopyWithImpl(
      _$PersonalImpl _value, $Res Function(_$PersonalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Personal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = null,
    Object? sex = null,
    Object? birthday = null,
    Object? occupation = null,
  }) {
    return _then(_$PersonalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: null == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalImpl implements _Personal {
  _$PersonalImpl(
      {required this.id,
      required this.name,
      required this.age,
      required this.sex,
      required this.birthday,
      required this.occupation});

  factory _$PersonalImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int age;
  @override
  final String sex;
  @override
  final String birthday;
  @override
  final String occupation;

  @override
  String toString() {
    return 'Personal(id: $id, name: $name, age: $age, sex: $sex, birthday: $birthday, occupation: $occupation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, age, sex, birthday, occupation);

  /// Create a copy of Personal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalImplCopyWith<_$PersonalImpl> get copyWith =>
      __$$PersonalImplCopyWithImpl<_$PersonalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalImplToJson(
      this,
    );
  }
}

abstract class _Personal implements Personal {
  factory _Personal(
      {required final int id,
      required final String name,
      required final int age,
      required final String sex,
      required final String birthday,
      required final String occupation}) = _$PersonalImpl;

  factory _Personal.fromJson(Map<String, dynamic> json) =
      _$PersonalImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get age;
  @override
  String get sex;
  @override
  String get birthday;
  @override
  String get occupation;

  /// Create a copy of Personal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalImplCopyWith<_$PersonalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
