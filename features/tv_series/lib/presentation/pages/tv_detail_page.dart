import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common/constants.dart';
import 'package:common/common/routes.dart';
import 'package:common/presentation/common/genre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/presentation/bloc/detail/tv_detail_bloc.dart';

class TvDetailPage extends StatelessWidget {
  TvDetailPage({required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => TvDetailBloc()..add(TvDetailFetchDataEvent(tvId: id)),
        child: BlocBuilder<TvDetailBloc, TvDetailState>(
          builder: (context, state) {
            if (state is TvDetailFetchSuccessState) {
              if (state.message.isNotEmpty) {
                Future.microtask(
                  () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  ),
                );
              }
              return _buildDetail(
                state.detail,
                state.recommendations,
                state.isWatchlisted,
              );
            } else if (state is TvDetailFetchFailedState) {
              return _buildError(state.message);
            } else {
              return _buildLoading();
            }
          },
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
    return Text(message);
  }

  Widget _buildDetail(
    TvDetail detail,
    List<TvSeries> recommendations,
    bool isWatchlisted,
  ) {
    return SafeArea(
      child: DetailContent(
        detail: detail,
        recommendations: recommendations,
        isAddedWatchlist: isWatchlisted,
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key? key,
    required this.detail,
    required this.recommendations,
    required this.isAddedWatchlist,
  }) : super(key: key);

  final TvDetail detail;
  final List<TvSeries> recommendations;
  final bool isAddedWatchlist;

  @override
  Widget build(BuildContext context) {
    print("Recommendations");
    print(recommendations);
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '$BASE_IMAGE_URL${detail.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detail.name ?? "",
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (!isAddedWatchlist) {
                                  BlocProvider.of<TvDetailBloc>(context).add(
                                    TvDetailAddToWatchlistEvent(
                                      detail: detail,
                                      recommendations: recommendations,
                                    ),
                                  );
                                } else {
                                  BlocProvider.of<TvDetailBloc>(context).add(
                                    TvDetailRemoveWatchlistEvent(
                                      detail: detail,
                                      recommendations: recommendations,
                                    ),
                                  );
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(detail.genres),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating:
                                      (detail.voteAverage ?? 0).toDouble() / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${detail.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              detail.overview ?? "",
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Seasons',
                              style: kHeading6,
                            ),
                            if (detail.seasons.isNotEmpty)
                              Container(
                                height: 150,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final season = detail.seasons[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        child: Stack(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl:
                                                  'https://image.tmdb.org/t/p/w500${season.posterPath}',
                                              placeholder: (context, url) =>
                                                  Container(
                                                width: 100,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              ),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Container(
                                                      width: 100,
                                                      child: const Center(
                                                          child: Icon(
                                                              Icons.error))),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                color: Colors.black
                                                    .withOpacity(.8),
                                                padding:
                                                    const EdgeInsets.all(4),
                                                width: double.infinity,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      season.name ?? "",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      "Eps ${season.episodeCount}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: detail.seasons.length,
                                ),
                              ),
                            if (recommendations.isNotEmpty)
                              Container(
                                height: 150,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final movie = recommendations[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            tvDetailRoute,
                                            arguments: movie.id,
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                            placeholder: (context, url) =>
                                                Container(
                                              width: 100,
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: recommendations.length,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            initialChildSize: 0.5,
            minChildSize: 0.25,
            maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
