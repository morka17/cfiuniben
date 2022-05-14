import 'package:cfi_nexus/utils/view_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cfi_nexus/widgets/Default_navbar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
    Size size = MediaQuery.of(context).size;
    double width = reSizeWidth(context);

    return Container(
      height: size.height,
      width: width,
      decoration: kviewBorder,
      child: Column(
        children: <Widget>[
          const DefaultNavBar(label: "About Us"),
          SizedBox(
            height: size.width <= 500 ? size.height - 92 : size.height - 50,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TitleBar(width: width, title: "History"),
                  const Content(
                    content:
                        "Christian Fellowship International is a non-denomination body of Christ that has it roots from CHURCH OF GOD MISSON INTERNATIONAL.\nThe vision was birthed by Archbishop B.A Idahosa to a group of university students in Faith Arena.\n   CFI started in 1990/91 academic session at the sport complex of the university of benin. Cfi since it was founded has grow with different chapter spread across the nation in various tertiary institutions.\n   All we seek to attain is contained in the vision of CFI",
                  ),
                  TitleBar(width: width, title: "Vision Statement:"),
                 const Content(
                      content:
                          "To be a 21St century GOD-CLASS youth and campus minstry, employing cutting-edge technolgies and techniques in proclaiming the gospel of our Lord Jesus, By the inspiration of the Holy Spirit"),
                  TitleBar(width: width, title: "Our Mission:"),
                  const Content(
                      content:
                          "To Raise EFFECTIVE and efficient Christain leaders and Disciples of Christ who are sound in spirit, soul and body excelling in their chosen fields (Academics, Professions, Politcs,Business,Ministry, Sports, Entertainment,Tourism,Arts and Culture) by deliberate training."),
                  TitleBar(width: width, title: "Our Objectives:"),
                 const Content(
                    content:
                        "1. To Identify and retain members of the mission in tertiary institutions John 17:12 Heb 10:24-25\n2. To serve as a grooming ground for the future leadership of the mission in particular and the church in general, 2 Tim 2:2, 1 Tim 4:12-6.\n3. To Generate friendship and fellowship amongst members of the mission  and members of other ministries in the fellowship within and outSide campus.1 pet.2:17b Acts 2:44-47\n4. To Encourage optimu co-operation in academic and social experiences on campus. 2Thes.3:13, Gal 6:10\n5. To Encourage alliances of members in the pursuit of prospects outside campus - ministry, business, profession ,politics, etc Acts 18:3\n6. To Carry Out on campus th vision evangelism and outreach\n our supreme tack 2cor.5:-17 and 20a\n7. To Sustain our common faith in Christ on campus. Eph.5:19,Heb.3:12-13",
                  ),
                  TitleBar(width: width, title: "(Summary Of Objectives):"),
                  const Content(
                    content:
                        "Strengthening the confession or profession of our faith in Christ Jesus through fellowship. Attainment and pusuit of acamedic excellence through deliberate training Creating partnership from campus for ministry, business, profession, social and politics in order to effect positive changes in our society.",
                  ),
                  TitleBar(width: width, title: "Main Attack:"),
                 const Content(
                    content:
                        "✔ Soul Winning\n✔ Discipleship\n✔ Leadership\n✔ Academic Excellence.",
                  ),
                  TitleBar(width: width, title: "Target Audience:"),
                 const Content(
                    content: "Undergraduates and youths in general.",
                  ),
                  TitleBar(width: width, title: "Core Message:"),
                 const Content(content: "The Gospel of our Lord Christ."),
                  TitleBar(width: width, title: "Method:"),
                 const  Content(
                    content: "Creative Dynamism, inpsired by the Holy Spirit",
                  ),
                  TitleBar(width: width, title: "MOTTO:"),
                 const Content(
                      content:
                          "...Using GOD's Love to groom the future of today."),
                  TitleBar(width: width, title: "Our Drive"),
                 const Content(
                      content:
                          "the pursuit of excellence.",
                          ),
                  TitleBar(width: width, title: "Core Purpose"),
                 const Content(
                    content:
                        "Enforcing GOD's Kingdom in our immediate\n environment, society, our nation and the nations of the earth",
                  ),
                  TitleBar(width: width, title: "Core Competence"),
                 const  Content(content: "Ministry Excellence, leadership development, youth empowerment, national transformation."),
                  TitleBar(width: width, title: "Tools"),
                 const  Content(content: "Music/Dance/Drama Outreach Programs, Small group meetings,\nAcademic Excellence, Showing Love, Leadership Traning Programs, Academics & Relational Seminars, Fellowship Planting etc."),
                  // TitleBar(
                  //   width: width,
                  //   title: "The Spirit (Values & Attitude) of CFI",
                  // ),
                  // Content(content: "")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String content;
  const Content({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4.0, left: 40, bottom: 4),
      child: Text(
        content,
        style: GoogleFonts.ubuntu(fontSize: 16, color: Colors.black),
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  final String title;
  const TitleBar({
    Key? key,
    required this.title,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40.0, top: 7),
      width: width,
      height: 30.0,
      color: Colors.blue.withAlpha(250),
      child: Text(
        title,
        style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 17.0),
      ),
    );
  }
}
