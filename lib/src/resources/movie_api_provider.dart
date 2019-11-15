import 'package:bloc_project_list_movies/src/models/item_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:async';
import 'dart:convert';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  Future<ItemModel> fetchMovieList() async {
    print('entered');
    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Post');
    }
  }
}
