import 'package:cfi_nexus/providers/comment.dart';
import 'package:cfi_nexus/providers/home.dart';
import 'package:cfi_nexus/repository/comment.dart';
import 'package:cfi_nexus/repository/post.dart';
import 'package:cfi_nexus/views/Posts_view.dart';
import 'package:cfi_nexus/widgets/comment_card.dart';
import 'package:cfi_nexus/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentView extends StatelessWidget {
  static const String id = "/comments";

  const CommentView({Key? key}) : super(key: key);

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
                ? maxWidth * 0.77
                : size.width < 950
                    ? maxWidth * 0.70
                    : size.width < 1020
                        ? maxWidth * 0.60
                        : maxWidth * 0.5;
    return Container(
      height: size.height,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 0.5, color: Colors.grey.shade300),
          right: BorderSide(width: 0.5, color: Colors.grey.shade300),
        ),
        color: Colors.white,
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
                      children: [
                        IconButton(
                            onPressed: () => context
                                .read<HomeView>()
                                .changeView(const PostsView()),
                            icon: const Icon(Icons.arrow_back)),
                        const SizedBox(
                          width: 40.0,
                        ),
                      const  Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          SizedBox(
            height: size.width <= 500 ? size.height - 97 : size.height - 50,
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                PostCard(post: post, width: width),
                for (var comment in comments)
                   CommentCard(comment: comment, width: width)  
              ],
            )),
          ),
        ],
      ),
    );
  }
}
