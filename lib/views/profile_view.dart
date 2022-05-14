import 'package:cfi_nexus/providers/bio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:cfi_nexus/providers/home.dart';
import 'package:cfi_nexus/providers/profile.dart';
import 'package:cfi_nexus/screens/update_screen.dart';
import 'package:cfi_nexus/utils/view_border.dart';
import 'package:cfi_nexus/views/settings_view.dart';
import 'package:cfi_nexus/views/update_profile.dart';
import 'package:cfi_nexus/widgets/Default_navbar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  double reSizeWidth(context) {
    Size size = MediaQuery.of(context).size;
    double maxWidth = size.width < 1500 ? size.width : 1300;

    if (size.width <= 500) {
      return maxWidth;
    } else if (size.width < 700) {
      return maxWidth * 0.85;
    } else if (size.width < 770) {
      return maxWidth * 0.77;
    } else if (size.width < 950) {
      return maxWidth * 0.70;
    } else if (size.width < 1020) {
      return maxWidth * 0.60;
    }
    return maxWidth * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final photo = context.watch<BioView>().image;
    double width = reSizeWidth(context);
    return Container(
      height: size.height,
      width: width,
      decoration: kviewBorder,
      child: Column(
        children: <Widget>[
          DefaultNavBar(
            label: "Profile",
            navIcon: Icons.settings,
            onNavIcon: () =>
                context.read<HomeView>().changeView(const SettingsView()),
          ),
          SizedBox(
            height: size.width <= 500 ? size.height - 93 : size.height - 50,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: width,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          CircleAvatar(
                            radius: 75,
                            backgroundImage:
                                photo != null ? FileImage(photo) : null,
                          ),
                          IconButton(
                            onPressed: () =>
                                context.read<BioView>().pickImage(context),
                            icon: const Icon(
                              Icons.camera_enhance,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ProfileTile(
                      title: "Username", value: "@Morkajoshua", width: width),
                  ProfileTile(title: "First", value: "Joshua", width: width),
                  ProfileTile(title: "Last", value: "Morka", width: width),
                  ProfileTile(
                      title: "Faculty",
                      value: "Physical Science",
                      width: width),
                  ProfileTile(
                      title: "Department",
                      value: "Computer Science",
                      width: width),
                  ProfileTile(
                      title: "Residence",
                      value: "101 Newton Street",
                      width: width),
                  ProfileTile(title: "Cell", value: "Shekinah", width: width),
                  ProfileTile(title: "Unit", value: "Itech", width: width),
                  ProfileTile(
                    title: "Alumni",
                    value: "YES",
                    width: width,
                  ),
                  ProfileTile(
                    title: "Email",
                    value: "joshuamorka4@gmail.com",
                    width: width,
                  ),
                  ProfileTile(
                      title: "Phone", value: "+234707824924", width: width),
                  ProfileTile(title: "Country", value: "Germany", width: width),
                  ProfileTile(
                      title: "State", value: "Maryland D.C", width: width),
                  ProfileTile(title: "City", value: "Edo", width: width),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final double width;
  final String title;
  final String value;
  const ProfileTile({
    Key? key,
    required this.title,
    required this.value,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        context.read<Updater>().getDetail(title, value);
        if (size.width <= 500) {
          Navigator.pushNamed(context, UpdateScreen.id);
        } else {
          context.read<HomeView>().changeView(const ProfileUpdateView());
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 16.0),
              ),
              Text(
                value,
                style: GoogleFonts.ubuntu(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
