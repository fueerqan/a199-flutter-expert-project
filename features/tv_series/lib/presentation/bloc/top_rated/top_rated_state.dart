part of 'top_rated_bloc.dart';

@immutable
abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoadingState extends TopRatedState {}

class TopRatedFetchFailedState extends TopRatedState {
  TopRatedFetchFailedState({required this.message});

  final String message;
}

class TopRatedFetchSuccessState extends TopRatedState {
  TopRatedFetchSuccessState({required this.tvSeries});

  final List<TvSeries> tvSeries;
}
