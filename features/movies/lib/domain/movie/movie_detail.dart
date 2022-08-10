import 'package:common/data/models/movie_table.dart';
import 'package:common/data/models/movie_type.dart';
import 'package:common/presentation/common/genre.dart';
import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  MovieDetail({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String? backdropPath;
  final List<Genre> genres;
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        id,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount,
      ];

  MovieTable toMovieTable() => MovieTable(
        id: id,
        title: title,
        posterPath: posterPath,
        overview: overview,
        movieType: MovieType.movie,
      );
}
