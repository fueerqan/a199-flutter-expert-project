import 'package:ditonton/data/models/movie_type.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/entities/movie/movie_detail.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
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

  factory MovieTable.fromEntity({MovieDetail? movie, TvDetail? tv}) =>
      (movie != null)
          ? MovieTable(
              id: movie.id,
              title: movie.title,
              posterPath: movie.posterPath,
              overview: movie.overview,
              movieType: MovieType.movie,
            )
          : MovieTable(
              id: tv?.id ?? 0,
              title: tv?.name ?? "",
              posterPath: tv?.posterPath,
              overview: tv?.overview,
              movieType: MovieType.tv,
            );

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

  Movie toEntity() => Movie.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        title: title,
      );

  TvSeries toTvEntity() => TvSeries.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        title: title,
      );

  @override
  List<Object?> get props => [id, title, posterPath, overview, movieType];
}
