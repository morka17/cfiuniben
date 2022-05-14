import 'package:cfi_nexus/providers/bio.dart';
import 'package:cfi_nexus/providers/home.dart';
import 'package:cfi_nexus/utils/view_border.dart';
import 'package:cfi_nexus/widgets/Default_navbar.dart';
import 'package:cfi_nexus/widgets/tweet_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({Key? key}) : super(key: key);

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
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
    double width = reSizeWidth(context);
    final photo = context.watch<BioView>().image;
    var image = context.watch<HomeView>().image;
    return Container(
      width: width,
      decoration: kviewBorder,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const DefaultNavBar(
              label: "",
              leftNavIcon: Icons.close,
              rightNavChild: Midbutton(
                label: "Post",
                width: 100,
                height: 20,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: photo != null ? FileImage(photo) : null,
                  child: photo == null
                      ? const Center(
                          child: Icon(
                            Icons.person,
                            size: 25.0,
                            color: Colors.black54,
                          ),
                        )
                      : null,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: width - 75),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextField(
                        minLines: 1,
                        maxLines: 10,
                        maxLength: 250,
                        decoration: InputDecoration(
                          hintText: "Write a message here...",
                          border: InputBorder.none,
                          focusedBorder: null,
                          enabledBorder: null,
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            context.read<HomeView>().pickImage(context),
                        icon: const Icon(
                          Icons.image,
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        child: image != null
                            ? SizedBox(
                                width: width,
                                child: Container(
                                  constraints: BoxConstraints(
                                      minHeight: 350, maxWidth: width - 75),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      alignment: Alignment.topCenter,
                                      image: FileImage(image),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          context.read<HomeView>().image = null;
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.cancel,
                                            size: 30.0),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
