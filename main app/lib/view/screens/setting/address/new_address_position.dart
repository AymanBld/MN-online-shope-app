import 'package:finale/view/widgets/auth/button.dart';
import 'package:finale/view/widgets/onboarding/app_bar.dart';
import 'package:flutter/material.dart';

class NewAdrressPosition extends StatelessWidget {
  const NewAdrressPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustumAppBar(title: 'Set position'),
      body: Stack(
        children: [
          Container(
            color: Colors.grey[400],
            height: 700,
            width: double.infinity,
          ),
          Positioned(
            child: CustumButton(
              text: 'Set',
              ontap: () {},
            ),
          )
        ],
      ),
    );
  }
}
