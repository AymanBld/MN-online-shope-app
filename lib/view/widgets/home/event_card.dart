import 'package:finale/core/constant/colors.dart';
import 'package:flutter/material.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColor.primryColorDark,
            borderRadius: BorderRadius.circular(30),
          ),
          height: 150,
          width: double.infinity,
        ),
        const Text(
          '   New \n    Product',
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: -70,
          right: -50,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green[600],
            ),
            height: 200,
            width: 200,
          ),
        ),
      ],
    );
  }
}
