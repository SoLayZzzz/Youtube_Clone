import 'package:flutter/material.dart';
import 'package:youtube_clone/color/color.dart';
import 'package:youtube_clone/component/profile/option.dart';

Future<dynamic> ShowBottomSheetEdit(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: noColor,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          height: 5,
                          width: 50,
                          decoration: BoxDecoration(
                              color: grey,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OptionSelect(
                          icon: Icons.play_arrow_outlined,
                          text: "Play next in queue",
                          ontap: () {
                            print("object");
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: OptionSelect(
                            icon: Icons.schedule_outlined,
                            text: "Save to Watch later",
                            ontap: () {}),
                      ),
                      OptionSelect(
                          icon: Icons.bookmark_outline,
                          text: "Save to playlist",
                          ontap: () {}),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: OptionSelect(
                            icon: Icons.forward_outlined,
                            text: "Share",
                            ontap: () {}),
                      ),
                      OptionSelect(
                          icon: Icons.delete_outlined,
                          text: "Remove from watch history",
                          ontap: () {}),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      });
}
