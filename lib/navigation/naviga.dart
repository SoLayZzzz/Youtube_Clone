import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/color/color.dart';
import 'package:youtube_clone/provider/navigaProvider.dart';
import 'package:youtube_clone/view/MyDrawer.dart';

class NavigaScreen extends StatefulWidget {
  const NavigaScreen({super.key});

  @override
  State<NavigaScreen> createState() => _NavigaScreenState();
}

class _NavigaScreenState extends State<NavigaScreen> {
  late NavigaProvider mp;
  @override
  void initState() {
    mp = Provider.of<NavigaProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigaProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          key: mp.scaffoldKey,
          drawer: MyDrawer(),
          body: mp.item[mp.selectIndex].widget,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: grey,
                  blurRadius: 2,
                ),
              ],
            ),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: black,
                currentIndex: mp.selectIndex,
                onTap: (value) {
                  mp.selectIndex = value;
                },
                items: mp.item
                    .map((e) => BottomNavigationBarItem(
                          icon: Icon(
                            e.icon,
                            size: e.size,
                          ),
                          label: e.label,
                        ))
                    .toList()),
          ),
        );
      },
    );
  }
}
