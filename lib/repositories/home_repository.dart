import 'package:aula_splash/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
