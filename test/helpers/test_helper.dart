import 'package:common/data/datasource/movie_local_data_source.dart';
import 'package:common/helper/database_helper.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

@GenerateMocks([
  WatchlistRepository,
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  TvRepository,
  DatabaseHelper,
  IOClient,
])
void main() {}
