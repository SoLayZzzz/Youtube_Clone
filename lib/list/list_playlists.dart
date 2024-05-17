import 'package:flutter/material.dart';
import 'package:youtube_clone/color/color.dart';
import 'package:youtube_clone/component/iconbotton.dart';

class ListPlayLists extends StatelessWidget {
  const ListPlayLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(children: [
                Container(
                  width: 180,
                  decoration: const BoxDecoration(color: noColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 160,
                        decoration: BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: red,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(1, -4),
                              )
                            ]),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      child: Text(
                                        "Flutter Demo Khmer",
                                        style: TextStyle(
                                            color: black.withOpacity(0.8),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const Spacer(),
                                    IconBottonEdit(
                                        icon: Icons.more_vert, ontap: () {})
                                  ],
                                ),
                                const Text("SokLay"),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ]),
            );

            // );
          }),
    );
  }
}
