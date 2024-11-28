
import 'package:final_delivery/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final String text;
  final void Function() ontap;
  const CustumButton({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: ontap,
      padding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColor.primryColorDark,
      textColor: Colors.white,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
