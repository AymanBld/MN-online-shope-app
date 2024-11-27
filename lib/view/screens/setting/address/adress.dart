import 'package:finale/controller/setting/address/address_ctrl.dart';
import 'package:finale/core/class/handling_states.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/core/constant/routes.dart';
import 'package:finale/data/model/address_model.dart';
import 'package:finale/view/widgets/onboarding/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressCtrl());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.newAddress);
        },
        shape: const CircleBorder(),
        backgroundColor: AppColor.primryColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: const CustumAppBar(title: 'Address'),
      body: GetBuilder<AddressCtrl>(
        builder: (controller) => HandlingStates(
          status: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: controller.addressList.length,
                itemBuilder: (context, index) {
                  AddressModel adr = AddressModel.fromJson(controller.addressList[index]);
                  return CustomAddress(adr: adr);
                }),
          ),
        ),
      ),
    );
  }
}

class CustomAddress extends GetView<AddressCtrl> {
  final AddressModel adr;
  const CustomAddress({
    super.key,
    required this.adr,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${adr.addressName}'),
      subtitle: Text('${adr.addressCity}, ${adr.addressStreet}'),
      trailing: IconButton(
        onPressed: () {
          controller.removeAddress(adr.addressId!, adr.addressName!);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
