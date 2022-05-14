import 'package:cfi_nexus/providers/home.dart';
import 'package:cfi_nexus/screens/create_post.dart';
import 'package:cfi_nexus/utils/color_palette.dart';
import 'package:cfi_nexus/views/Posts_view.dart';
import 'package:cfi_nexus/views/about_us.dart';
import 'package:cfi_nexus/views/create_post.dart';
import 'package:cfi_nexus/views/feedback_view.dart';
import 'package:cfi_nexus/views/profile_view.dart';
import 'package:cfi_nexus/widgets/drawer_widget.dart';
import 'package:cfi_nexus/widgets/tweet_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const double resizeWidth = 1280;

class HomeScreen extends StatefulWidget {
  static const String id = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double maxWidth = size.width < 1500 ? size.width : 1300;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: size.width <= 500
          ? FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () =>
                  Navigator.pushNamed(context, CreatePostScreen.id),
              child: const Icon(Icons.add, color: Colors.white),
              tooltip: "add",
            )
          : null,
      drawer: size.width <= 500 ? const DrawerWidget() : null,
      appBar: size.width <= 500
          ? AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title:  SizedBox(
                height: 50.0,
                width: 50.0,
                child: Image.asset(
                  "images/cfi-logo1.jpeg",
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  tooltip: "Refresh",
                  icon: const  Icon(
                    Icons.star_border,
                    color: Colors.blueGrey,
                    size: 27.0,
                  ),
                )
              ],
            )
          : null,
      bottomNavigationBar: size.width <= 500 ? const BottomNavBar() : null,
      body: Center(
        child: Container(
          constraints:
              BoxConstraints(maxWidth: maxWidth, maxHeight: size.height),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                LayoutBuilder(builder: (context, constraints) {
                  if (size.width <= 500) {
                    return Container();
                  } else if (size.width < 770) {
                    return Container(
                      constraints:
                          BoxConstraints(maxWidth: maxWidth * 0.15),
                      color: Colors.white,
                      child: NavItems(
                        width: maxWidth * 0.15,
                      ),
                    );
                  } else if (maxWidth <= 1200) {
                    return Container(
                      constraints:
                          BoxConstraints(maxWidth: maxWidth * 0.15),
                      color: Colors.white,
                      child: NavItems(
                        width: maxWidth * 0.15,
                      ),
                    );
                  } else if (maxWidth < resizeWidth) {
                    return Container(
                      constraints: BoxConstraints(maxWidth: maxWidth * 0.1),
                      color: Colors.white,
                      child: NavItems(
                        width: maxWidth * 0.2,
                      ),
                    );
                  } else {
                    return Container(
                      constraints:
                          BoxConstraints(maxWidth: maxWidth * 0.20),
                      color: Colors.white,
                      child: NavItems(
                        width: maxWidth * 0.20,
                      ),
                    );
                  }
                }),
                Container(
                  child: context.watch<HomeView>().view,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        if (index == 0) {
          context.read<HomeView>().changeView(PostsView());
        } else if (index == 1) {
          context.read<HomeView>().changeView(Container());
        } else if (index == 2) {
          context.read<HomeView>().changeView(Container());
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.black54,
          ),
          label: "Home",
          tooltip: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.video_library,
            color: Colors.black54,
          ),
          label: "Video",
          tooltip: "Video",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.credit_card,
            color: Colors.black54,
          ),
          label: "Giving",
          tooltip: "Giving",
        )
      ],
    );
  }
}

class NavItems extends StatelessWidget {
  final double? width;
  const NavItems({
    Key? key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: const EdgeInsets.only(left: 8.0),
      width: width,
      child: Column(
        crossAxisAlignment: size.width < resizeWidth
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: size.width < resizeWidth
                ? const EdgeInsets.only(right: 30, top: 20, bottom: 10)
                : const EdgeInsets.only(left: 10, top: 20, bottom: 15.0),
            child: Image.asset(
              "images/cfi-logo1.jpeg",
              width: 50,
            ),
          ),
          SizedBox(
            height: size.width > 1277 ? size.height - 140 : size.height - 120,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  NavItem(
                      label: "Home",
                      icon: Icons.home_outlined,
                      onPressed: () => context.read<HomeView>().changeView(
                            PostsView(),
                          )),
                  NavItem(
                    label: "Upcoming Events",
                    icon: Icons.event,
                    onPressed: () =>
                        context.read<HomeView>().changeView(Container()),
                  ),
                  NavItem(
                    label: "Video",
                    icon: Icons.video_library,
                    onPressed: () => context.read<HomeView>().changeView(
                         const Center(
                            child: Icon(
                              Icons.video_library,
                            ),
                          ),
                        ),
                  ),
                  NavItem(
                    label: "Audio Message'",
                    icon: Icons.multitrack_audio,
                    onPressed: () => context.read<HomeView>().changeView(
                      const  Center(child: Icon(Icons.bookmark_outline))),
                  ),
                  NavItem(
                    label: "Ebooks",
                    icon: Icons.book,
                    onPressed: () => context.read<HomeView>().changeView(
                      const  Center(child: Icon(Icons.list_alt_rounded))),
                  ),
                  NavItem(
                    label: "Giving",
                    icon: Icons.credit_card,
                    onPressed: () => context.read<HomeView>().changeView(const Center(
                            child: Icon(
                          Icons.feedback,
                        ))),
                  ),
                  NavItem(
                    label: "Messages",
                    icon: Icons.mail_outline,
                    onPressed: () => context.read<HomeView>().changeView(
                       const  Center(child: Icon(Icons.message_outlined))),
                  ),
                  NavItem(
                      label: "About Us",
                      icon: Icons.info,
                      onPressed: () =>
                          context.read<HomeView>().changeView(const AboutUs())),
                  NavItem(
                    label: "Feedback",
                    icon: Icons.feedback,
                    onPressed: () =>
                        context.read<HomeView>().changeView(const FeedbackView()),
                  ),
                  NavItem(
                    label: "Profile",
                    icon: Icons.person_outline,
                    onPressed: () =>
                        context.read<HomeView>().changeView(const ProfileView()),
                  ),
                ],
              ),
            ),
          ),
          TweetButton(
            onPressed: () {
              context.read<HomeView>().changeView(const CreatePostView());
            },
            width: width! - 50.0,
            label: "Post",
            height: 40.0,
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function()? onPressed;
  const NavItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 0.5),
      child: RawMaterialButton(
        // fillColor: Colors.black12,
        hoverColor: AppColor.gold4,
        onPressed: onPressed,
        shape: size.width < resizeWidth
            ? const CircleBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
        child: Container(
          height: size.width < resizeWidth ? 55.0 : 45,
          padding: const EdgeInsets.only(left: 10.0),
          constraints:
              BoxConstraints(maxWidth: size.width < resizeWidth ? 55 : 200.0),
          child: Row(
            children: <Widget>[
              Center(
                  child: Tooltip(
                      message: label,
                      child: Icon(
                        icon,
                        size: 30,
                        color: Colors.black54,
                      ))),
              const SizedBox(width: 15.0),
              MediaQuery.of(context).size.width < resizeWidth
                  ? Container()
                  : Text(
                      label,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
