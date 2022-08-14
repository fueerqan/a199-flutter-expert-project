import 'package:common/data/models/movie_table.dart';
import 'package:common/data/models/movie_type.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';

class MovieTableMapper {

  static MovieTable mapTvDetailToMovieTable(TvDetail tvDetail) => MovieTable(
        id: tvDetail.id ?? 0,
        title: tvDetail.name ?? "",
        posterPath: tvDetail.posterPath,
        overview: tvDetail.overview,
        movieType: MovieType.tv,
      );

}
