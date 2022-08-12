part of 'tv_detail_bloc.dart';

@immutable
abstract class TvDetailState {}

class TvDetailInitial extends TvDetailState {}

class TvDetailLoadingState extends TvDetailState {}

class TvDetailFetchFailedState extends TvDetailState {
  TvDetailFetchFailedState({required this.message});

  final String message;
}

class TvDetailFetchSuccessState extends TvDetailState {
  TvDetailFetchSuccessState({
    required this.detail,
    required this.recommendations,
    required this.isWatchlisted,
    this.message = "",
  });

  final TvDetail detail;
  final List<TvSeries> recommendations;
  final bool isWatchlisted;
  final String message;
}

class TvDetailAddWatchListFailedState extends TvDetailState {
  TvDetailAddWatchListFailedState({required this.message});

  final String message;
}
