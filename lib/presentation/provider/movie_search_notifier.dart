import 'package:common/common/state_enum.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:flutter/foundation.dart';
import 'package:movies/domain/movie/movie.dart';
import 'package:tv_series/domain/entities/tv.dart';

class MovieSearchNotifier extends ChangeNotifier {
  final SearchMovies searchMovies;

  MovieSearchNotifier({required this.searchMovies});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Movie> _searchResult = [];
  List<Movie> get searchResult => _searchResult;

  List<TvSeries> _searchTvResult = [];
  List<TvSeries> get searchTvResult => _searchTvResult;

  String _message = '';
  String get message => _message;

  String dropdownValue = SearchPage.dropdownOptions[0];
  String _query = "";

  Future<void> fetchMovieSearch(String query) async {
    _query = query;
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchMovies.execute(query, dropdownValue);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        data.fold(
          (movie) {
            _searchResult = movie;
            _searchTvResult = [];
          },
          (tv) {
            _searchResult = [];
            _searchTvResult = tv;
          },
        );
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  Future<void> changeSearchType(String? value) async {
    dropdownValue = value ?? SearchPage.dropdownOptions[0];
    notifyListeners();

    if (_query.isNotEmpty) {
      await fetchMovieSearch(_query);
    }
  }
}
