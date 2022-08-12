part of 'tv_detail_bloc.dart';

@immutable
abstract class TvDetailEvent {}

class TvDetailFetchDataEvent extends TvDetailEvent {
  TvDetailFetchDataEvent({required this.tvId});

  final int tvId;
}

class TvDetailAddToWatchlistEvent extends TvDetailEvent {
  TvDetailAddToWatchlistEvent({
    required this.detail,
    required this.recommendations,
  });

  final TvDetail detail;
  final List<TvSeries> recommendations;
}

class TvDetailRemoveWatchlistEvent extends TvDetailEvent {
  TvDetailRemoveWatchlistEvent({
    required this.detail,
    required this.recommendations,
  });

  final TvDetail detail;
  final List<TvSeries> recommendations;
}
