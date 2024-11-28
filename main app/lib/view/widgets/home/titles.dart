import 'package:finale/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleInHome extends StatelessWidget {
  final String title;
  const TitleInHome({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColor.primryColorDark,
          fontSize: 28,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
