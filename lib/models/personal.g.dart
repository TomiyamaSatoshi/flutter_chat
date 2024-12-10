// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalImpl _$$PersonalImplFromJson(Map<String, dynamic> json) =>
    _$PersonalImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      sex: json['sex'] as String,
      birthday: json['birthday'] as String,
      occupation: json['occupation'] as String,
    );

Map<String, dynamic> _$$PersonalImplToJson(_$PersonalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'sex': instance.sex,
      'birthday': instance.birthday,
      'occupation': instance.occupation,
    };
