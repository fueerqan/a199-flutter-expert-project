part of 'popular_bloc.dart';

@immutable
abstract class PopularState {}

class PopularInitial extends PopularState {}

class PopularLoadingState extends PopularState {}

class PopularFetchFailedState extends PopularState {
  PopularFetchFailedState({required this.message});

  final String message;
}

class PopularFetchSuccessState extends PopularState {
  PopularFetchSuccessState({required this.tvSeries});

  final List<TvSeries> tvSeries;
}
