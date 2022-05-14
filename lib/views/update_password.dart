import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cfi_nexus/utils/view_border.dart';
import 'package:cfi_nexus/widgets/Default_navbar.dart';
import 'package:cfi_nexus/widgets/tweet_button.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  double reSizeWidth(context) {
    Size size = MediaQuery.of(context).size;
    double maxWidth = size.width < 1500 ? size.width : 1300;

    if (size.width <= 500)
      return maxWidth;
    else if (size.width < 700)
      return maxWidth * 0.85;
    else if (size.width < 770)
      return maxWidth * 0.77;
    else if (size.width < 950)
      return maxWidth * 0.70;
    else if (size.width < 1020) return maxWidth * 0.60;
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
          DefaultNavBar(label: "Update password"),
          _Field(
            hint: '',
            label: 'Current password',
          ),
          _Field(
            hint: 'New password',
            label: 'At least 8 characters',
          ),
          _Field(
            hint: 'Confirm password',
            label: 'At least * characters',
          ),
          SizedBox(height: 15),
          Midbutton(label: 'Update password',),
          SizedBox(height: 5),
          Text(
            "Forgot password?",
            style: TextStyle(
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final String hint;
  const _Field({
    Key? key,
    required this.label,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 400.0),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
