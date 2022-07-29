import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_now_playing_tv.dart';
import 'package:ditonton/domain/usecases/get_popular_tv.dart';
import 'package:flutter/material.dart';

class TvListNotifier extends ChangeNotifier {
  var _nowPlayingTVs = <TvSeries>[];
  List<TvSeries> get nowPlayingTVs => _nowPlayingTVs;

  RequestState _nowPlayingState = RequestState.Empty;
  RequestState get nowPlayingState => _nowPlayingState;

  var _popularTVs = <TvSeries>[];
  List<TvSeries> get popularTVs => _popularTVs;

  RequestState _popularTVsState = RequestState.Empty;
  RequestState get popularTVsState => _popularTVsState;

  // var _topRatedMovies = <Movie>[];
  // List<Movie> get topRatedMovies => _topRatedMovies;

  // RequestState _topRatedMoviesState = RequestState.Empty;
  // RequestState get topRatedMoviesState => _topRatedMoviesState;

  String _message = '';
  String get message => _message;

  TvListNotifier({
    required this.getNowPlayingTvs,
    required this.getPopularTVs,
    // required this.getTopRatedMovies,
  });

  final GetNowPlayingTv getNowPlayingTvs;
  final GetPopularTv getPopularTVs;
  // final GetTopRatedMovies getTopRatedMovies;

  Future<void> fetchNowPlayingTvSeries() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingTvs.execute();
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

  Future<void> fetchPopularTvSeries() async {
    _popularTVsState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTVs.execute();
    result.fold(
      (failure) {
        _popularTVsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _popularTVsState = RequestState.Loaded;
        _popularTVs = tvSeriesData;
        notifyListeners();
      },
    );
  }

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
