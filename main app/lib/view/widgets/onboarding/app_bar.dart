import 'package:finale/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustumAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustumAppBar({
    super.key,
    required this.title,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.backgroundColor,
      leading: Navigator.canPop(context)
          ? IconButton(
              onPressed: () {
                Navigator.canPop(Get.context!);
                return Get.back();
              },
              color: Colors.grey,
              icon: const Icon(Icons.arrow_back_ios_new),
            )
          : null,
      // backgroundColor: Colors.white,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}
