import 'package:flutter/material.dart';
import 'package:youtube_clone/color/color.dart';
import 'package:youtube_clone/component/setting/setting_option.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(
            height: 1,
            color: grey,
          )),
      centerTitle: false,
      title: const Text(
        "Settings",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SettingOP(ontap: () {}, text: "Purchases and memberships"),
        SettingOP(ontap: () {}, text: "Account"),
        SettingOP(ontap: () {}, text: "General"),
        SettingOP(ontap: () {}, text: "Autoplay"),
        SettingOP(ontap: () {}, text: "Try experimental new features"),
        SettingOP(ontap: () {}, text: "Video quality preferences"),
        SettingOP(ontap: () {}, text: "Notification"),
        SettingOP(ontap: () {}, text: "Connected apps"),
        SettingOP(ontap: () {}, text: "Manage all history"),
        SettingOP(ontap: () {}, text: "Your data in YouTube"),
        SettingOP(ontap: () {}, text: "Privacy"),
        SettingOP(ontap: () {}, text: "Offline"),
        SettingOP(ontap: () {}, text: "Uploads"),
        SettingOP(ontap: () {}, text: "Live chat"),
        SettingOP(ontap: () {}, text: "About"),
      ],
    );
  }
}
