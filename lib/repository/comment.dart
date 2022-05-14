class Comment {
  String name;
  String preferName;
  String time;
  String message;
  String imgUrl;
  int commentsNum;
  int retweetsNum;
  int likesNum;
  Comment({
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

List<Comment> comments = [
  Comment(
    name: 'BJohn Peterson ',
    preferName: '@JPeterson',
    imgUrl: '',
    time: "1min",
    commentsNum: 1,
    likesNum: 2,
    retweetsNum: 2,
    message:  ''' This is super 🤯'''
  ),
   Comment(
    name: 'BJame Gunt',
    preferName: '@BJame_Gunt',
    imgUrl: '',
    time: "1h",
    commentsNum: 2,
    likesNum: 5,
    retweetsNum: 1,
    message:  '''Slient 🤐🤐'''
  ),
  Comment(
    name: 'Bhunter Bill',
    preferName: '@hunt_bill',
    imgUrl: '',
    time: "3 min",
    commentsNum: 2,
    likesNum: 5,
    retweetsNum: 1,
    message:  '''When is it going to happen Dad and Mom 👴🧓'''
  )
];
