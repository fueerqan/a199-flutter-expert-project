import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';

  static const dropdownOptions = [
    "Movie",
    "Tv Series",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onSubmitted: (query) {
                      Provider.of<MovieSearchNotifier>(context, listen: false)
                          .fetchMovieSearch(query);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search title',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.search,
                  ),
                ),
                SizedBox(width: 8),
                Consumer<MovieSearchNotifier>(
                  builder: (context, data, child) => DropdownButton(
                    value: data.dropdownValue,
                    items: dropdownOptions
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: data.changeSearchType,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            Consumer<MovieSearchNotifier>(
              builder: (context, data, child) {
                if (data.state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (data.state == RequestState.Loaded) {
                  final result = (data.searchResult.isNotEmpty)
                      ? data.searchResult
                      : data.searchTvResult;

                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final movie = result[index];
                        if (movie is Movie) {
                          return MovieCard(movie);
                        } else if (movie is TvSeries) {
                          return TvCard(movie);
                        } else {
                          return Container();
                        }
                      },
                      itemCount: result.length,
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
