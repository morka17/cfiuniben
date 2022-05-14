import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'package:cfi_nexus/providers/bio.dart';
import 'package:cfi_nexus/providers/comment.dart';
import 'package:cfi_nexus/providers/home.dart';
import 'package:cfi_nexus/providers/profile.dart';
import 'package:cfi_nexus/providers/welcome.dart';
import 'package:cfi_nexus/screens/Feedback_screen.dart';
import 'package:cfi_nexus/screens/aboutus_screen.dart';
import 'package:cfi_nexus/screens/bio_screen.dart';
import 'package:cfi_nexus/screens/comments_screen.dart';
import 'package:cfi_nexus/screens/create_post.dart';
import 'package:cfi_nexus/screens/home_screen.dart';
import 'package:cfi_nexus/screens/image_screen.dart';
import 'package:cfi_nexus/screens/password_update_screen.dart';
import 'package:cfi_nexus/screens/profile_screen.dart';
import 'package:cfi_nexus/screens/settings_screen.dart';
import 'package:cfi_nexus/screens/update_screen.dart';
import 'package:cfi_nexus/screens/welcome_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => WelcomeView()),
      ChangeNotifierProvider(create: (_) => BioView()),
      ChangeNotifierProvider(create: (_) => HomeView()),
      ChangeNotifierProvider(create: (_) => Comments()),
      ChangeNotifierProvider(create: (_) => Updater()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CFI Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        BioScreen.id: (context) => const  BioScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        CommentsScreen.id: (context) => const CommentsScreen(),
        ImageScreen.id: (context) => const ImageScreen(),
        AboutUsScreen.id: (context) => const AboutUsScreen(),
        FeedbackScreen.id: (context) => const  FeedbackScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        SettingsScreen.id: (context) => const SettingsScreen(),
        UpdateScreen.id: (context) => const  UpdateScreen(),
        
        PasswordUpdateScreen.id: (context) => const PasswordUpdateScreen(),
        CreatePostScreen.id: (context) => const  CreatePostScreen(),
      }
    );
  }
}

