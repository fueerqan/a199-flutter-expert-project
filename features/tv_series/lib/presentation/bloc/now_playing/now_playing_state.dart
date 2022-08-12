part of 'now_playing_bloc.dart';

@immutable
abstract class NowPlayingState {}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoadingState extends NowPlayingState {}

class NowPlayingFetchSuccessState extends NowPlayingState {
  NowPlayingFetchSuccessState({required this.tvSeries});

  final List<TvSeries> tvSeries;
}

class NowPlayingFetchFailedState extends NowPlayingState {
  NowPlayingFetchFailedState({required this.message});

  final String message;
}
