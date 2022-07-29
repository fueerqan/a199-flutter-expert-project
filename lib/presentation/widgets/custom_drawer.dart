import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/tv_list_page.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';
import 'package:flutter/material.dart';

enum CurrentPage {
  tvSeries,
  movies,
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.currentPage}) : super(key: key);

  final CurrentPage currentPage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/circle-g.png'),
            ),
            accountName: Text('Ditonton'),
            accountEmail: Text('ditonton@dicoding.com'),
          ),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text('Movies'),
            onTap: () {
              if (currentPage == CurrentPage.movies) {
                Navigator.pop(context);
              } else {
                Navigator.pushNamed(context, HomeMoviePage.ROUTE_NAME);
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.tv),
            title: Text('Tv Series'),
            onTap: () {
              if (currentPage == CurrentPage.tvSeries) {
                Navigator.pop(context);
              } else {
                Navigator.pushNamed(context, TvListPage.ROUTE_NAME);
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.save_alt),
            title: Text('Watchlist'),
            onTap: () {
              Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
            },
            leading: Icon(Icons.info_outline),
            title: Text('About'),
          ),
        ],
      ),
    );
  }
}
