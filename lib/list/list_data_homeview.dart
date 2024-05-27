import 'package:flutter/material.dart';
import 'package:youtube_clone/color/color.dart';
import 'package:youtube_clone/data/homeview_data.dart';

class ListHomeViewData extends StatelessWidget {
  ListHomeViewData({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: HomeViewData.homeviewdata.length,
        itemBuilder: (context, idx) {
          final data = HomeViewData.homeviewdata[idx];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 210,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(data.image ?? ""),
                        fit: BoxFit.fitWidth)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(data.pf ?? ""),
                      radius: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${data.title}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text(
                              "${data.nameAcc} .",
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${data.viewDetail}",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          );
        });
  }
}
