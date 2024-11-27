import 'package:flutter/material.dart';

class CustumHaveAccount extends StatelessWidget {
  final String pageToGo;
  final String textBefor;
  final void Function() onTap;
  const CustumHaveAccount({
    super.key,
    required this.pageToGo,
    required this.textBefor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textBefor),
        InkWell(
          onTap: onTap,
          child: Text(
            pageToGo,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.green[900]),
          ),
        )
      ],
    );
  }
}
