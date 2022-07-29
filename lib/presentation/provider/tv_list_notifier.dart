import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_now_playing_tv.dart';
import 'package:flutter/material.dart';

class TvListNotifier extends ChangeNotifier {
  var _nowPlayingTVs = <TvSeries>[];
  List<TvSeries> get nowPlayingTVs => _nowPlayingTVs;

  RequestState _nowPlayingState = RequestState.Empty;
  RequestState get nowPlayingState => _nowPlayingState;

  // var _popularMovies = <Movie>[];
  // List<Movie> get popularMovies => _popularMovies;

  // RequestState _popularMoviesState = RequestState.Empty;
  // RequestState get popularMoviesState => _popularMoviesState;

  // var _topRatedMovies = <Movie>[];
  // List<Movie> get topRatedMovies => _topRatedMovies;

  // RequestState _topRatedMoviesState = RequestState.Empty;
  // RequestState get topRatedMoviesState => _topRatedMoviesState;

  String _message = '';
  String get message => _message;

  TvListNotifier({
    required this.getNowPlayingMovies,
    // required this.getPopularMovies,
    // required this.getTopRatedMovies,
  });

  final GetNowPlayingTv getNowPlayingMovies;
  // final GetPopularMovies getPopularMovies;
  // final GetTopRatedMovies getTopRatedMovies;

  Future<void> fetchNowPlayingMovies() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingMovies.execute();
    result.fold(
      (failure) {
        _nowPlayingState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _nowPlayingState = RequestState.Loaded;
        _nowPlayingTVs = moviesData;
        notifyListeners();
      },
    );
  }

  // Future<void> fetchPopularMovies() async {
  //   _popularMoviesState = RequestState.Loading;
  //   notifyListeners();

  //   final result = await getPopularMovies.execute();
  //   result.fold(
  //     (failure) {
  //       _popularMoviesState = RequestState.Error;
  //       _message = failure.message;
  //       notifyListeners();
  //     },
  //     (moviesData) {
  //       _popularMoviesState = RequestState.Loaded;
  //       _popularMovies = moviesData;
  //       notifyListeners();
  //     },
  //   );
  // }

  // Future<void> fetchTopRatedMovies() async {
  //   _topRatedMoviesState = RequestState.Loading;
  //   notifyListeners();

  //   final result = await getTopRatedMovies.execute();
  //   result.fold(
  //     (failure) {
  //       _topRatedMoviesState = RequestState.Error;
  //       _message = failure.message;
  //       notifyListeners();
  //     },
  //     (moviesData) {
  //       _topRatedMoviesState = RequestState.Loaded;
  //       _topRatedMovies = moviesData;
  //       notifyListeners();
  //     },
  //   );
  // }
}
