import 'dart:convert';

import 'package:movie_app/data/model/movie_response_model.dart';
import 'package:http/http.dart' as http;

class Repostitory {
  String baseURL = 'https://mocki.io/v1/9515acf2-0bbb-4bdd-8568-2f0dbedb0748';
  Future<MovieResponseModel> getDetailMovie() async {
    final response = await http.get(Uri.parse(baseURL));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      MovieResponseModel result = MovieResponseModel.fromJson(data[0]);
      return result;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }
}
