import 'package:finale/controller/search_ctrl.dart';
import 'package:finale/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    SearchCtrl searchController = Get.put(SearchCtrl());
    return SafeArea(
      child: Row(
        children: [
          if (navigator!.canPop())
            SizedBox(
              width: 35,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
          Expanded(
            child: TextField(
              controller: searchController.searchCtrl,
              onChanged: (value) {},
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                prefixIcon: IconButton(
                  onPressed: () {
                    searchController.onSearch();
                  },
                  icon: const Icon(Icons.search),
                ),
                hintText: 'Search',
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            height: 50,
            width: 50,
            child: const Icon(
              Icons.notifications_none,
              // size: 25,
            ),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.myFavorite);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              height: 50,
              width: 50,
              child: const Icon(
                Icons.favorite_border,
                // size: 25,
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
