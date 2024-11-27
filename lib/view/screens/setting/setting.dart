import 'package:finale/controller/setting/setting_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingCtrl controller = Get.put(SettingCtrl());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset('assets/images/Gemini_Generated_Image_ew4d9lew4d9lew4d.jfif'),
          ),
          Text(
            'Ayman Bld',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          ...List.generate(
            controller.settingList.length,
            (index) => TitleInSetting(
              icon: controller.settingList[index].icon,
              title: controller.settingList[index].title,
              onPress: controller.settingList[index].onTap,
            ),
          )
        ],
      ),
    );
  }
}

class TitleInSetting extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onPress;
  const TitleInSetting({
    super.key,
    required this.icon,
    required this.title,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onPress,
    );
  }
}
