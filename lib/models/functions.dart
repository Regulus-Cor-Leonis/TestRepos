import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/endpoints.dart';
import 'package:movie_app/models/credits.dart';
import 'package:movie_app/models/genres.dart';
import 'package:movie_app/models/movie.dart';

Future<List<Movie>> fetchMovies(String api) async {
  MovieList movieList;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  movieList = MovieList.fromJson(decodeRes);
  return movieList.movies ?? [];
}

Future<GenresList> fetchGenres() async {
  GenresList genresList;
  var res = await http.get(Uri.parse(Endpoints.genresUrl()));
  var decodeRes = jsonDecode(res.body);
  genresList = GenresList.fromJson(decodeRes);
  return genresList;
}

Future<Credits> fetchCredits(String api) async {
  Credits credits;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  credits = Credits.fromJson(decodeRes);
  return credits;
}
