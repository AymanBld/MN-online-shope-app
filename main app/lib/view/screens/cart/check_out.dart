import 'package:finale/controller/orders/check_out_ctrl.dart';
import 'package:finale/view/widgets/auth/button.dart';
import 'package:finale/view/widgets/check_out/address_chose.dart';
import 'package:finale/view/widgets/check_out/label_choic.dart';
import 'package:finale/view/widgets/home/titles.dart';
import 'package:finale/view/widgets/onboarding/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutCtrl controller = Get.put(CheckOutCtrl());
    return Scaffold(
      appBar: const CustumAppBar(title: 'Check Out'),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder<CheckOutCtrl>(
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleInHome(title: 'Chose Payment Method'),
                Row(children: [
                  LableChoic(
                    text: 'Card Payemnt',
                    isSelected: controller.payment == 1,
                    onPress: () {
                      controller.changePayment(1);
                    },
                  ),
                  LableChoic(
                    text: 'Cash on Delivery',
                    isSelected: controller.payment == 2,
                    onPress: () {
                      controller.changePayment(2);
                    },
                  )
                ]),
                const SizedBox(height: 30),
                const TitleInHome(title: 'Shipping Address'),
                const AddressChose(),
                const SizedBox(height: 30),
                const TitleInHome(title: 'Payment'),
              ],
            ),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: CustumButton(
          text: 'Buy Now',
          ontap: () {
            controller.buyNow();
          },
        ),
      ),
    );
  }
}
