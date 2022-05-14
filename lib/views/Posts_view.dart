import 'package:cfi_nexus/repository/post.dart';
import 'package:cfi_nexus/widgets/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double resizeWidth = 1280;

List<Post> posts = [
  Post(
      name: 'BChris Nathan RPN-GTL ',
      preferName: '@BChris_Nathan',
      imgUrl: 'images/img1.jfif',
      time: "1h",
      commentsNum: 5,
      likesNum: 24,
      retweetsNum: 4,
      message:
          '''In the plan go God, grace must be greater than the responsibility otherwise we will be achieving for God by efforts and not by Grace. -RPN\n\n#BreadOfLifeWithRPN\n\nyoutube.com/c/THEGOOD-LIFE...\nfacebook.com/TGLFInc/\ninstagram.com/TGLFInc/ '''),
  Post(
      name: 'BChris Nathan RPN-GTL ',
      preferName: '@BChris_Nathan',
      imgUrl: 'images/img2.jfif',
      time: "1h",
      commentsNum: 5,
      likesNum: 24,
      retweetsNum: 4,
      message:
          '''In the plan go God, grace must be greater than the responsibility otherwise we will be achieving for God by efforts and not by Grace. -RPN\n\n#BreadOfLifeWithRPN\n\nyoutube.com/c/THEGOOD-LIFE...\nfacebook.com/TGLFInc/\ninstagram.com/TGLFInc/ '''),
  Post(
      name: 'BChris Nathan RPN-GTL ',
      preferName: '@BChris_Nathan',
      imgUrl: 'images/loading-image2.jpeg',
      time: "1h",
      commentsNum: 5,
      likesNum: 24,
      retweetsNum: 4,
      message:
          '''In the plan go God, grace must be greater than the responsibility otherwise we will be achieving for God by efforts and not by Grace. -RPN\n\n#BreadOfLifeWithRPN\n\nyoutube.com/c/THEGOOD-LIFE...\nfacebook.com/TGLFInc/\ninstagram.com/TGLFInc/ ''')
];

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double maxWidth = size.width < 1500 ? size.width : 1300;
    return Row(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            if (size.width <= 500) {
              return Container(
                constraints: BoxConstraints(maxWidth: maxWidth),
                color: Colors.white,
                child: PostsPage(width: maxWidth),
              );
            } else if (size.width < 700) {
              return Container(
                constraints: BoxConstraints(maxWidth: maxWidth * 0.85),
                color: Colors.white,
                child: PostsPage(width: maxWidth * 0.85),
              );
            }
            if (size.width < 770) {
              return Container(
                constraints: BoxConstraints(maxWidth: maxWidth * 0.77),
                color: Colors.white,
                child: PostsPage(width: maxWidth * 0.77),
              );
            } else if (size.width < 950) {
              return Container(
                constraints: BoxConstraints(maxWidth: maxWidth * 0.70),
                color: Colors.white,
                child: PostsPage(width: maxWidth * 0.70),
              );
            } else if (size.width < 1020) {
              return Container(
                constraints: BoxConstraints(maxWidth: maxWidth * 0.60),
                color: Colors.white,
                child: PostsPage(width: maxWidth * 0.60),
              );
            } else if (maxWidth < 1280) {
              return Container(
                constraints: BoxConstraints(maxWidth: maxWidth * 0.50),
                color: Colors.white,
                child: PostsPage(width: maxWidth * 0.50),
              );
            } else {
              return Container(
                constraints: BoxConstraints(maxWidth: maxWidth * 0.50),
                color: Colors.white,
                child: PostsPage(width: maxWidth * 0.50),
              );
            }
          },
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (size.width < 1020) {
              return Container();
            } else if (maxWidth >= 1020) {
              return Container(
                constraints: BoxConstraints(maxWidth: maxWidth * 0.30),
                color: Colors.blue,
                // child: SideTweetView(),
              );
            } else {
              return Container(
                constraints: BoxConstraints(maxWidth: maxWidth * 0.30),
                color: Colors.blue,
                // child: Si(),
              );
            }
          },
        ),
      ],
    );
  }
}

class PostsPage extends StatelessWidget {
  final double width;
  const PostsPage({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(maxHeight: size.height, maxWidth: width),
      decoration: BoxDecoration(
        // color: AppColor.gold3,
        border: Border(
          left: BorderSide(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
          right: BorderSide(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        children: [
          size.width <= 500
              ? Container()
              : Opacity(
                  opacity: 0.5,
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.star_border),
                        )
                      ],
                    ),
                  ),
                ),
          SizedBox(
            height: size.width <= 500 ? size.height - 148 : size.height - 50,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (Post post in posts)
                    PostCard(width: width, post: post),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
