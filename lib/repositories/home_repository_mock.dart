import 'dart:convert';

import 'package:aula_splash/models/post_model.dart';
import 'package:aula_splash/repositories/home_repository.dart';
import 'package:flutter/services.dart';

class HomeRepostoryMock implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    var value = await rootBundle.loadString('assets/data.json');
    List postJson = jsonDecode(value);
    return postJson.map((e) => PostModel.fromJson(e)).toList();
  }
}
