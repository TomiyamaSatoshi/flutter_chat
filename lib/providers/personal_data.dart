import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat/models/personal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'personal_data.g.dart';

@riverpod
class PersonalData extends _$PersonalData {
  @override
  Future<List<Personal>> build() async {
    WidgetsFlutterBinding.ensureInitialized();
    // JSON <--- Stub
    final json = await rootBundle.loadString('lib/stub/personal.json');
    // JsonMap <--- JSON
    final personalListMap = jsonDecode(json);

    List<Personal> personalList = [];
    for (Map<String, dynamic> value in personalListMap['personalList']) {
      personalList.add(Personal.fromJson(value));
    }
    return personalList;
  }
}
