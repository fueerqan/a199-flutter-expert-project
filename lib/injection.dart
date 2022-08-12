import 'package:common/data/datasource/movie_local_data_source.dart';
import 'package:common/data/db/database_helper.dart';
import 'package:ditonton/data/datasources/remote_datasource.dart';
import 'package:ditonton/domain/repositories/search_repository.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';
import 'package:movies/data/datasource/movie_remote_data_source.dart';
import 'package:tv_series/data/datasources/tv_remote_data_source.dart';
import 'package:tv_series/data/repositories/tv_repository_impl.dart';
import 'package:movies/data/repositories/movie_repository_impl.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';
import 'package:ditonton/domain/usecases/get_tv_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/get_watchlist_movies.dart';

import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/domain/usecases/get_watchlist_status.dart';
import 'package:movies/domain/usecases/remove_watchlist.dart';
import 'package:movies/domain/usecases/save_watchlist.dart';
import 'package:movies/presentation/provider/movie_detail_notifier.dart';
import 'package:movies/presentation/provider/movie_list_notifier.dart';
import 'package:movies/presentation/provider/popular_movies_notifier.dart';
import 'package:movies/presentation/provider/top_rated_movies_notifier.dart';
import 'package:tv_series/domain/usecases/get_now_playing_tv.dart';
import 'package:tv_series/domain/usecases/get_popular_tv.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv.dart';
import 'package:tv_series/domain/usecases/get_tv_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_recommendations.dart';
import 'package:tv_series/domain/usecases/get_tv_watchlist_status.dart';
import 'package:tv_series/domain/usecases/remove_tv_watchlist.dart';
import 'package:tv_series/domain/usecases/save_tv_watchlist.dart';
import 'package:tv_series/presentation/providers/now_playing_tv_notifier.dart';
import 'package:tv_series/presentation/providers/popular_tv_notifier.dart';
import 'package:tv_series/presentation/providers/top_rated_tv_notifier.dart';
import 'package:tv_series/presentation/providers/tv_detail_notifier.dart';
import 'package:tv_series/presentation/providers/tv_list_notifier.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory<TvListNotifier>(
    () => TvListNotifier(
      getNowPlayingTvs: locator(),
      getPopularTVs: locator(),
      getTopRatedTVs: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTvNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingTvNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvDetailNotifier(
      getTvDetail: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
      getRecommendations: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTvNotifier(
      getTopRatedMovies: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetNowPlayingTv(locator()));
  locator.registerLazySingleton(() => GetTopRatedTv(locator()));
  locator.registerLazySingleton(() => GetPopularTv(locator()));
  locator.registerLazySingleton(() => GetTvDetail(locator()));
  locator.registerLazySingleton(() => SaveTvWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveTvWatchlist(locator()));
  locator.registerLazySingleton(() => GetTvWatchListStatus(locator()));
  locator.registerLazySingleton(() => GetTvWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetTvRecommendations(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvRepository>(
    () => TvRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<WatchlistRepository>(
    () => WatchlistRepository(localDataSource: locator()),
  );
  locator.registerLazySingleton<SearchRepository>(
    () => SearchRepository(remoteDataSource: locator()),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvRemoteDataSource>(
      () => TvRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
