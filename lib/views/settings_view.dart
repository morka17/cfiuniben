import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cfi_nexus/providers/home.dart';
import 'package:cfi_nexus/screens/password_update_screen.dart';
import 'package:cfi_nexus/screens/profile_screen.dart';
import 'package:cfi_nexus/screens/welcome_screen.dart';
import 'package:cfi_nexus/views/profile_view.dart';
import 'package:cfi_nexus/views/update_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:cfi_nexus/utils/view_border.dart';
import 'package:cfi_nexus/widgets/Default_navbar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

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
    var ctl = context.read<HomeView>();
    Size size = MediaQuery.of(context).size;
    double width = reSizeWidth(context);
    return Container(
      height: size.height,
      width: width,
      decoration: kviewBorder,
      child: Column(
        children: <Widget>[
          const DefaultNavBar(label: "Settings"),
          SizedBox(
            height: size.width <= 500 ? size.height - 97 : size.height - 50,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SettingsTile(
                    onTap: () {
                      if (size.width <= 500) {
                        Navigator.pushNamed(context, ProfileScreen.id);
                      } else {
                        ctl.changeView(const ProfileView());
                      }
                    },
                    width: width,
                    subtitle: 'See information about your account.',
                    title: 'Account Information',
                    icon: Icons.person,
                  ),
                  SettingsTile(
                    onTap: () {
                      if (size.width <= 500) {
                        Navigator.pushNamed(context, PasswordUpdateScreen.id);
                      } else {
                        ctl.changeView(const UpdatePassword());
                      }
                    },
                    width: width,
                    subtitle: 'Change your password at any time.',
                    title: 'Change your password',
                    icon: Icons.lock,
                  ),
                  SettingsTile(
                    onTap: () => showOkCancelAlertDialog(
                      context: context,
                      title: "Warning",
                      message:
                          "Are you sure you want to delete your account? all data will be easer for the server",
                       okLabel: 'Delete',
                       useActionSheetForCupertino: true,
                    ),
                    width: width,
                    subtitle: 'Deactivate your account.',
                    title: 'Deactivate Account',
                    icon: Icons.cancel_sharp,
                  ),
                  SettingsTile(
                    onTap: () => Get.offAll(() => const WelcomeScreen()),
                    width: width,
                    subtitle: 'Logout your account from this device.',
                    title: 'Logout',
                    icon: Icons.logout,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function()? onTap;
  const SettingsTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: width,
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(
          title,
        ),
        subtitle: Text(subtitle),
        // trailing: Text("See information about your account."),
      ),
    );
  }
}
