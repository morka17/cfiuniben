import 'package:cfi_nexus/repository/comment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CommentCard extends StatelessWidget {
  final Comment comment;
  const CommentCard({
    Key? key,
    required this.comment,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // // context.read<Comments>().getPost(post);
        // if (size.width <= 500) {
        //   Navigator.pushNamed(context, CommentsScreen.id);
        // } else
        //   // ignore: curly_braces_in_flow_control_structures
        //   context.read<HomeView>().changeView(const CommentView());
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5.0),
        width: width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 0.5),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          children: [
            const SizedBox(width: 5.0),
            const CircleAvatar(
              radius: 26,
            ),
            const SizedBox(width: 7.0),
            SizedBox(
              width: width - 65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: (width - 65) * 0.7,
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.black, fontSize: 13.0),
                                  children: [
                                    TextSpan(
                                      text: comment.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\n${comment.preferName}",
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Text("-${comment.time}")
                          ],
                        ),
                      ),
                      PopupMenuButton(
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
                                    Icon(Icons.report, color:Colors.black54),
                                     SizedBox(
                                      width: 10,
                                    ),
                                    Text("Report")
                                  ],
                                ),
                            ),
                            PopupMenuItem(
                              value: 1,
                              child: Row(
                                  children: const [
                                     Icon(Icons.edit, color:Colors.black54),
                                     SizedBox(
                                      width: 10,
                                    ),
                                    Text("Edit")
                                  ],
                                ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child:Row(
                                  children: const  [
                                     Icon(Icons.delete, color:Colors.black54),
                                     SizedBox(
                                      width: 10,
                                    ),
                                     Text("Delete")
                                  ],
                                ),
                            ),
                          ];
                        },
                        onSelected: (index) {
                          // todo:
                        },
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 0.50),
                    width: width - 55,
                    child: Text(
                      comment.message,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                 comment.imgUrl != '' ?  Container(
                    padding: const EdgeInsets.only(right: 5.0),
                    margin: const EdgeInsets.only(top: 5.0),
                    constraints: BoxConstraints(
                      maxWidth: width - 55,
                      maxHeight: 430.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // context.read<Comments>().getPost(post);
                        // if (size.width <= 500) {
                        //   Navigator.pushNamed(context, ImageScreen.id);
                        // } else {
                        //   context.read<HomeView>().changeView(const ImageView());
                        // }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(comment.imgUrl),
                      ),
                    ),
                  ): Container(),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        PostAction(
                            icon: Icons.comment,
                            label: comment.commentsNum.toString()),
                        PostAction(
                            icon: Icons.circle,
                            label: comment.likesNum.toString()),
                        const PostAction(icon: Icons.share, label: ""),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostAction extends StatelessWidget {
  final IconData icon;
  final String label;
  const PostAction({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 40.0,
          child: RawMaterialButton(
            padding: const EdgeInsets.all(0.0),
            hoverColor: Colors.blue.shade200,
            highlightColor: Colors.blue.shade300,
            splashColor: Colors.blue.shade300,
            // ignore: avoid_print
            onPressed: () => print('pressed'),
            shape: const CircleBorder(),
            child: Icon(
              icon,
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.black54),
        )
      ],
    );
  }
}
