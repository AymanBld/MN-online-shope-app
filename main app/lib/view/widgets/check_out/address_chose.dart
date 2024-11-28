import 'package:finale/controller/orders/check_out_ctrl.dart';
import 'package:finale/core/constant/colors.dart';
import 'package:finale/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddressChose extends StatelessWidget {
  const AddressChose({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutCtrl>(
      builder: (controller) => DropdownButton<int>(
        value: controller.address,
        itemHeight: 90,
        isExpanded: true,
        elevation: 0,
        dropdownColor: Colors.transparent,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColor.primryColorDark,
          size: 30,
        ),
        hint: const Text('Chose Address'),
        items: List.generate(
          controller.addressList.length,
          (index) {
            AddressModel adr = AddressModel.fromJson(controller.addressList[index]);
            return DropdownMenuItem(
              value: adr.addressId,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primryColorDark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  subtitleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                  title: Text(adr.addressName!),
                  subtitle: Text('${adr.addressCity}, ${adr.addressStreet}'),
                ),
              ),
            );
          },
        ),
        onChanged: (value) {
          controller.changeAdr(value!);
        },
      ),
    );
  }
}
