class Post {
  String name;
  String preferName;
  String time;
  String message;
  String imgUrl;
  int commentsNum;
  int retweetsNum;
  int likesNum;
  Post({
    required this.name,
    required this.preferName,
    required this.time,
    required this.message,
    required this.imgUrl,
    required this.commentsNum,
    required this.retweetsNum,
    required this.likesNum,
  });
}

List<Post> posts = [
  Post(
    name: 'BChris Nathan RPN-GTL ',
    preferName: '@BChris_Nathan',
    imgUrl: 'assest/images/img2.jfif',
    time: "1h",
    commentsNum: 5,
    likesNum: 24,
    retweetsNum: 4,
    message:  '''In the plan go God, grace must be greater than the responsibility otherwise we will be achieving for God by efforts and not by Grace. -RPN\n\n#BreadOfLifeWithRPN\n\nyoutube.com/c/THEGOOD-LIFE...\nfacebook.com/TGLFInc/\ninstagram.com/TGLFInc/ '''
  ),
   Post(
    name: 'BChris Nathan RPN-GTL ',
    preferName: '@BChris_Nathan',
    imgUrl: 'assest/images/img2.jfif',
    time: "1h",
    commentsNum: 5,
    likesNum: 24,
    retweetsNum: 4,
    message:  '''In the plan go God, grace must be greater than the responsibility otherwise we will be achieving for God by efforts and not by Grace. -RPN\n\n#BreadOfLifeWithRPN\n\nyoutube.com/c/THEGOOD-LIFE...\nfacebook.com/TGLFInc/\ninstagram.com/TGLFInc/ '''
  )
];
