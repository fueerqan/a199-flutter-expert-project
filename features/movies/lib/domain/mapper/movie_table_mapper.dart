import 'package:common/data/models/movie_table.dart';
import 'package:common/data/models/movie_type.dart';
import 'package:movies/domain/movie/movie_detail.dart';

class MovieTableMapper {
  static MovieTable mapMovieDetailToMovieTable(MovieDetail movieDetail) =>
      MovieTable(
        id: movieDetail.id,
        title: movieDetail.title,
        posterPath: movieDetail.posterPath,
        overview: movieDetail.overview,
        movieType: MovieType.movie,
      );
}
