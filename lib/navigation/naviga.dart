import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/color/color.dart';
import 'package:youtube_clone/provider/navigaProvider.dart';

class NavigaScreen extends StatefulWidget {
  const NavigaScreen({super.key});

  @override
  State<NavigaScreen> createState() => _NavigaScreenState();
}

class _NavigaScreenState extends State<NavigaScreen> {
  @override
  Widget build(BuildContext context) {
    final mp = Provider.of<NavigaProvider>(context);
    return Scaffold(
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
  }
}
