import 'package:common/data/models/movie_type.dart';
import 'package:equatable/equatable.dart';

class MovieTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;
  final MovieType? movieType;

  MovieTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.movieType,
  });

  factory MovieTable.fromMap(Map<String, dynamic> map) => MovieTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
        movieType:
            (map['type'] == "movie") ? MovieType.movie : MovieType.tv,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
        'type': (movieType == MovieType.movie) ? "movie" : "tv",
      };

  // Movie toEntity() => Movie.watchlist(
  //       id: id,
  //       overview: overview,
  //       posterPath: posterPath,
  //       title: title,
  //     );

  // TvSeries toTvEntity() => TvSeries.watchlist(
  //       id: id,
  //       overview: overview,
  //       posterPath: posterPath,
  //       title: title,
  //     );

  @override
  List<Object?> get props => [id, title, posterPath, overview, movieType];
}
