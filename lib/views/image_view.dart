import 'package:cfi_nexus/providers/comment.dart';
import 'package:cfi_nexus/providers/home.dart';
import 'package:cfi_nexus/repository/post.dart';
import 'package:cfi_nexus/views/Posts_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Post post = context.watch<Comments>().post!;
    Size size = MediaQuery.of(context).size;
    double maxWidth = size.width < 1500 ? size.width : 1300;
    double width = size.width <= 500
        ? maxWidth
        : size.width < 700
            ? maxWidth * 0.85
            : size.width < 770
                ? 0.77
                : size.width < 950
                    ? maxWidth * 0.70
                    : size.width < 1020
                        ? maxWidth * 0.60
                        : maxWidth * 0.5;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 0.5, color: Colors.grey.shade300),
          right: BorderSide(width: 0.5, color: Colors.grey.shade300),
        ),
      ),
      width: width,
      child: Column(
        children: <Widget>[
          size.width <= 500
              ? Container()
              : Opacity(
                  opacity: 0.5,
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () =>
                              context.read<HomeView>().changeView(PostsView()),
                          icon: const Icon(Icons.arrow_back),
                        ),
                        SizedBox(
                          height: 30.0,
                          child: PopupMenuButton(
                            // padding: const EdgeInsets.only(top: 0, bottom: 0, right: 0),
                            icon: const Icon(
                              Icons.more_vert,
                            ),
                            itemBuilder: (context) {
                              return <PopupMenuEntry<int>>[
                                PopupMenuItem(
                                  value: 0,
                                  child: Row(
                                    children: const [
                                      Icon(Icons.save, color: Colors.black54),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Save")
                                    ],
                                  ),
                                ),
                              ];
                            },
                            onSelected: (index) {
                              // todo:
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          Container(
            color: Colors.white38.withOpacity(0.3),
            height: size.width <= 500 ? size.height - 92 : size.height - 50,
            child: Container(
              padding: const EdgeInsets.only(right: 5.0),
              margin: const EdgeInsets.only(top: 5.0),
              constraints: BoxConstraints(
                maxWidth: size.width <= 500 ? size.width : width,
                maxHeight: 430.0,
              ),
              child: Image.asset(post.imgUrl, fit: BoxFit.fitWidth),
            ),
          )
        ],
      ),
    );
  }
}
