import 'package:equatable/equatable.dart';

class TvSeries extends Equatable {
  TvSeries({
    this.posterPath,
    required this.popularity,
    required this.id,
    this.backdropPath,
    required this.voteAverage,
    required this.overview,
    required this.firstAirDate,
    required this.originCountry,
    required this.genreIds,
    required this.originalLanguage,
    required this.voteCount,
    required this.title,
    required this.originalName,
  });

  String? posterPath;
  num? popularity;
  int id;
  String? backdropPath;
  num? voteAverage;
  String? overview;
  String? firstAirDate;
  List<String>? originCountry;
  List<int>? genreIds;
  String? originalLanguage;
  int? voteCount;
  String title;
  String? originalName;

  TvSeries.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
  });

  @override
  List<Object?> get props => [
        posterPath,
        popularity,
        id,
        backdropPath,
        voteAverage,
        overview,
        firstAirDate,
        originCountry,
        genreIds,
        originalLanguage,
        voteCount,
        title,
        originalName,
      ];
}
