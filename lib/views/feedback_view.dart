import 'package:cfi_nexus/utils/color_palette.dart';
import 'package:cfi_nexus/utils/view_border.dart';
import 'package:cfi_nexus/widgets/Default_navbar.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({Key? key}) : super(key: key);
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
      decoration: kviewBorder,
      height: size.height,
      width: width,
      child: Column(
        children: <Widget>[
          const DefaultNavBar(label: "Feedback"),
          Flexible(
            child: SizedBox(
              height: size.width <= 500 ? size.height - 92 : size.height - 50,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: const BoxConstraints(maxWidth: 500.0),
                    margin: const EdgeInsets.only(top: 15.0),
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      autocorrect: true,
                      minLines: 4,
                      maxLines: 7,
                      maxLength: 250,
                      decoration: InputDecoration(
                        hintText: "Share your throught",
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(width: 1.0, color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            width: 1.0,
                            color: AppColor.gold2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text("Submit"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
