import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/entities/movie/movie_detail.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_watchlist_status.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_tv_watchlist.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/save_tv_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TvDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTvDetail getTvDetail;
  // final GetMovieRecommendations getMovieRecommendations;
  final GetTvWatchListStatus getWatchListStatus;
  final SaveTvWatchlist saveWatchlist;
  final RemoveTvWatchlist removeWatchlist;

  TvDetailNotifier({
    required this.getTvDetail,
    required this.saveWatchlist,
    required this.getWatchListStatus,
    required this.removeWatchlist,
    // required this.getMovieRecommendations,
  });

  late TvDetail _detail;
  TvDetail get detail => _detail;

  RequestState _detailState = RequestState.Empty;
  RequestState get detailState => _detailState;

  // List<Movie> _movieRecommendations = [];
  // List<Movie> get movieRecommendations => _movieRecommendations;

  // RequestState _recommendationState = RequestState.Empty;
  // RequestState get recommendationState => _recommendationState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  Future<void> fetchTvDetail(int id) async {
    _detailState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getTvDetail.execute(id);
    // final recommendationResult = await getMovieRecommendations.execute(id);
    detailResult.fold(
      (failure) {
        _detailState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvDetail) {
        // _recommendationState = RequestState.Loading;
        _detail = tvDetail;
        notifyListeners();
        // recommendationResult.fold(
        //   (failure) {
        //     _recommendationState = RequestState.Error;
        //     _message = failure.message;
        //   },
        //   (movies) {
        //     _recommendationState = RequestState.Loaded;
        //     _movieRecommendations = movies;
        //   },
        // );
        _detailState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> addWatchlist(TvDetail detail) async {
    final result = await saveWatchlist.execute(detail);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(detail.id ?? 0);
  }

  Future<void> removeFromWatchlist(TvDetail detail) async {
    final result = await removeWatchlist.execute(detail);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(detail.id ?? 0);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchListStatus.execute(id);
    _isAddedtoWatchlist = result;
    notifyListeners();
  }
}
