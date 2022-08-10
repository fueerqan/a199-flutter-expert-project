import 'package:common/common/routes.dart';
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
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/circle-g.png'),
            ),
            accountName: Text('Ditonton'),
            accountEmail: Text('ditonton@dicoding.com'),
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Movies'),
            onTap: () {
              if (currentPage == CurrentPage.movies) {
                Navigator.pop(context);
              } else {
                Navigator.pushNamed(context, homeRoute);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.tv),
            title: const Text('Tv Series'),
            onTap: () {
              if (currentPage == CurrentPage.tvSeries) {
                Navigator.pop(context);
              } else {
                Navigator.pushNamed(context, tvListRoute);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('Watchlist'),
            onTap: () {
              Navigator.pushNamed(context, watchListRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
        ],
      ),
    );
  }
}
