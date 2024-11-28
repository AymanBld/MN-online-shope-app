import 'package:finale/controller/search_ctrl.dart';
import 'package:finale/view/widgets/home/appbar.dart';
import 'package:finale/view/widgets/search/grid_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchCtrl());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            HomeAppBar(),
            SizedBox(height: 10),
            GridSearch(),
          ]),
        ),
      ),
    );
  }
}
