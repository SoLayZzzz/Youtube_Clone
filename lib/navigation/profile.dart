import 'package:flutter/material.dart';
import 'package:youtube_clone/color/color.dart';
import 'package:youtube_clone/component/iconbotton.dart';
import 'package:youtube_clone/category/profileCate.dart';
import 'package:youtube_clone/component/profile/option.dart';
import 'package:youtube_clone/list/list_history.dart';
import 'package:youtube_clone/list/list_playlists.dart';
import 'package:youtube_clone/view/setting_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(children: [
        _buildAccount(),
        const SizedBox(
          height: 15,
        ),
        _buildListTab(),
        const SizedBox(
          height: 15,
        ),
        _buildHistory(),
        _buildDataHistory(),
        _buildPlayList(),
        const SizedBox(
          height: 5,
        ),
        _buildDataPlayList(),
        _buildOption()
      ]),
    );
  }

  AppBar _appBar() {
    return AppBar(
      scrolledUnderElevation: 0,
      actions: [
        IconBottonEdit(icon: Icons.cast, ontap: () {}),
        IconBottonEdit(icon: Icons.notifications_none_outlined, ontap: () {}),
        IconBottonEdit(icon: Icons.search_outlined, ontap: () {}),
        IconBottonEdit(
            icon: Icons.settings_outlined,
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()));
            }),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }

  Widget _buildAccount() {
    return const Padding(
      padding: EdgeInsets.only(left: 15),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/lay.jpg"),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Krem SokLay",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("@user-rj3xo7qc8z . View channel >")
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTab() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            ProfileCate(
              text: "Switch account",
              icon: Icons.switch_account_outlined,
            ),
            const SizedBox(
              width: 10,
            ),
            ProfileCate(
              text: "Email",
              icon: Icons.email_outlined,
            ),
            const SizedBox(
              width: 10,
            ),
            ProfileCate(
              text: "Turn on Incognito",
              icon: Icons.abc_sharp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "History",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: white,
                  elevation: 0,
                  minimumSize: const Size(15, 35),
                  side: BorderSide(width: 1, color: black.withOpacity(0.5))),
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => SettingScreen()));
              },
              child: const Text(
                "View all",
                style: TextStyle(color: black),
              ))
        ],
      ),
    );
  }

  Widget _buildDataHistory() {
    return const SizedBox(height: 200, child: ListHistory());
  }

  Widget _buildDataPlayList() {
    return const SizedBox(height: 200, child: ListPlayLists());
  }

  Widget _buildPlayList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Playlists",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: white,
                  elevation: 0,
                  minimumSize: const Size(15, 35),
                  side: BorderSide(width: 1, color: black.withOpacity(0.5))),
              onPressed: () {},
              child: const Text(
                "View all",
                style: TextStyle(color: black),
              ))
        ],
      ),
    );
  }

  Widget _buildOption() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: OptionSelect(
              icon: Icons.smart_display_outlined,
              text: "Your Videos",
              ontap: () {},
            ),
          ),
          OptionSelect(
            icon: Icons.download_outlined,
            text: "Downloads",
            ontap: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: _buildUnderLine(),
          ),
          OptionSelect(
            icon: Icons.movie_creation_outlined,
            text: "Your movies",
            ontap: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: OptionSelect(
              icon: Icons.video_call_outlined,
              text: "Get YouTube Premium",
              ontap: () {},
            ),
          ),
          _buildUnderLine(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: OptionSelect(
              icon: Icons.timelapse,
              text: "Time watched",
              ontap: () {},
            ),
          ),
          OptionSelect(
            icon: Icons.help_outline,
            text: "Help & feedback",
            ontap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildUnderLine() {
    return Container(
      width: double.infinity,
      height: 1,
      color: grey,
    );
  }
}
