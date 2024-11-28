import 'package:finale/view/widgets/favorite/grid_favs.dart';
import 'package:finale/view/widgets/home/appbar.dart';
import 'package:flutter/material.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            HomeAppBar(),
            GridFavorites(),
          ]),
        ),
      ),
    );
  }
}
