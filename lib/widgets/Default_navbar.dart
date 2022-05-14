import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cfi_nexus/providers/home.dart';
import 'package:cfi_nexus/views/Posts_view.dart';

class DefaultNavBar extends StatelessWidget {
  final Function()? onPressed;
  final Function()? onNavIcon;
  final IconData? navIcon;
  final Widget? rightNavChild;
  final IconData? leftNavIcon;
  final String label;
  const DefaultNavBar({
    Key? key,
    this.onPressed,
    this.onNavIcon,
    this.navIcon,
    this.rightNavChild,
    this.leftNavIcon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return size.width <= 500
        ? Container()
        : Opacity(
            opacity: 0.5,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.black54),
                ),
              ),
              height: 50,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Tooltip(
                    message: "back Home page",
                    child: IconButton(
                      onPressed: onPressed ??
                          () =>
                              context.read<HomeView>().changeView(const PostsView()),
                      icon: Icon(leftNavIcon ?? Icons.arrow_back),
                    ),
                  ),
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Tooltip(
                    message: "Back page",
                    child: rightNavChild ??
                        IconButton(
                          onPressed: onNavIcon ??
                              () => context.read<HomeView>().backView(),
                          icon: Icon(navIcon ?? Icons.close),
                        ),
                  ),
                ],
              ),
            ),
          );
  }
}
