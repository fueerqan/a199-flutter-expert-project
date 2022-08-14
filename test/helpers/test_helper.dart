import 'package:ditonton/domain/repositories/search_repository.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

@GenerateMocks([
  WatchlistRepository,
  SearchRepository,
  TvRepository,
  MovieRepository,
  IOClient,
])
void main() {}
