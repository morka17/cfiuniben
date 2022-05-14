import 'dart:io';

import 'package:cfi_nexus/providers/bio.dart';
import 'package:cfi_nexus/screens/Feedback_screen.dart';
import 'package:cfi_nexus/screens/aboutus_screen.dart';
import 'package:cfi_nexus/screens/profile_screen.dart';
import 'package:cfi_nexus/screens/settings_screen.dart';
import 'package:cfi_nexus/utils/color_palette.dart';
import 'package:cfi_nexus/widgets/cutomize_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final image = context.watch<BioView>().image;
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(width: 2.0, color: Colors.blueGrey.withAlpha(8)),
              ),
            ),
            child: DrawerHeader(
              decoration: const BoxDecoration(border: null, borderRadius: null),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   CircleAvatar(
                    radius: 50,
                    backgroundImage: image != null?  FileImage(context.watch<BioView>().image!) : null,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "BChris Nathan RPN-GTL",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: const Text(
                          "@BChris_Nathan",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.7,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CustomizeTile(
                    icon: Icons.person,
                    text: 'Profile',
                    onTap: () => Navigator.pushNamed(context, ProfileScreen.id),
                  ),
                  CustomizeTile(
                    icon: Icons.event,
                    text: 'Upcoming Events',
                    onTap: () {},
                  ),
                  CustomizeTile(
                    icon: Icons.multitrack_audio,
                    text: 'Audio Message',
                    onTap: () {},
                  ),
                  // CustomizeTile(
                  //   icon: Icons.group,
                  //   text: 'Cfite',
                  //   onTap: () {},
                  // ),
                  CustomizeTile(
                    icon: Icons.book,
                    text: 'Ebooks',
                    onTap: () {},
                  ),
                  // CustomizeTile(
                  //   icon: Icons.credit_card,
                  //   text: 'Giving',
                  //   onTap: () {},
                  // ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 25.0, bottom: 5.0, top: 5.0),
                    child: SizedBox(
                      height: 1.0,
                      child: Container(
                        color: AppColor.gold3,
                      ),
                    ),
                  ),
                  CustomizeTile(
                    icon: Icons.info,
                    text: 'About Us',
                    onTap: () =>
                        {Navigator.pushNamed(context, AboutUsScreen.id)},
                  ),

                  CustomizeTile(
                    icon: Icons.feedback,
                    text: 'FeedBack',
                    onTap: () => Navigator.pushNamed(
                      context,
                      FeedbackScreen.id,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 25.0, bottom: 5.0, top: 5.0),
                    child: SizedBox(
                      height: 1.0,
                      child: Container(
                        color: AppColor.gold3,
                      ),
                    ),
                  ),
                  // CustomizeTile(
                  //   icon: Icons.settings,
                  //   text: 'Setting',
                  //   onTap: () {},
                  // ),
                  CustomizeTile(
                      icon: Icons.settings,
                      text: 'Setting',
                      onTap: () =>
                          Navigator.pushNamed(context, SettingsScreen.id)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
