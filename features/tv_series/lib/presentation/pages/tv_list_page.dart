import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common/constants.dart';
import 'package:common/common/routes.dart';
import 'package:common/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:tv_series/presentation/bloc/popular/popular_bloc.dart';
import 'package:tv_series/presentation/bloc/top_rated/top_rated_bloc.dart';

class TvListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(currentPage: CurrentPage.tvSeries),
      appBar: AppBar(
        title: const Text('Tv Series'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, searchRoute);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    NowPlayingBloc()..add(NowPlayingFetchDataEvent()),
              ),
              BlocProvider(
                create: (_) => PopularBloc()..add(PopularFetchDataEvent()),
              ),
              BlocProvider(
                create: (_) => TopRatedBloc()..add(TopRatedFetchDataEvent()),
              ),
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSubHeading(
                  title: 'Now Playing',
                  onTap: () => Navigator.pushNamed(context, tvNowPlayingRoute),
                ),
                BlocBuilder<NowPlayingBloc, NowPlayingState>(
                  builder: (context, state) {
                    if (state is NowPlayingFetchSuccessState) {
                      return TvSeriesList(state.tvSeries);
                    } else if (state is NowPlayingFetchFailedState) {
                      return _buildError(state.message);
                    } else {
                      return _buildLoading();
                    }
                  },
                ),
                _buildSubHeading(
                  title: 'Popular',
                  onTap: () => Navigator.pushNamed(context, tvPopularRoute),
                ),
                BlocBuilder<PopularBloc, PopularState>(
                  builder: (context, state) {
                    if (state is PopularFetchSuccessState) {
                      return TvSeriesList(state.tvSeries);
                    } else if (state is PopularFetchFailedState) {
                      return _buildError(state.message);
                    } else {
                      return _buildLoading();
                    }
                  },
                ),
                _buildSubHeading(
                  title: 'Top Rated',
                  onTap: () => Navigator.pushNamed(context, tvTopRatedRoute),
                ),
                BlocBuilder<TopRatedBloc, TopRatedState>(
                  builder: (context, state) {
                    if (state is TopRatedFetchSuccessState) {
                      return TvSeriesList(state.tvSeries);
                    } else if (state is TopRatedFetchFailedState) {
                      return _buildError(state.message);
                    } else {
                      return _buildLoading();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(String message) {
    return Center(child: Text(message));
  }

  Widget _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvSeriesList extends StatelessWidget {
  final List<TvSeries> tvSeries;

  const TvSeriesList(this.tvSeries);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = tvSeries[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  tvDetailRoute,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => const SizedBox(
                    width: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
