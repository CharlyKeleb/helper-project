import 'package:dio/dio.dart';
import 'package:tests/model.dart';

class NetworkRequest {
  static String baseUrl = 'https://v2.jokeapi.dev';

  static Dio dio = Dio();

  static Future<JokeModel> getJoke(String type) async {
    var path = 'joke/$type';
    var a = await dio.getUri(Uri.parse('$baseUrl/$path'));
    return JokeModel.fromJson(a.data);
  }
}