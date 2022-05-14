import 'package:flutter/material.dart';

const double resizeWidth = 1280;

class TweetButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? label;
  final Function()? onPressed;
  const TweetButton({
    Key? key,
    required this.width,
    this.height,
    this.label, 
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.width < resizeWidth ? 5.0 : 10),
      child: RawMaterialButton(
        shape: size.width < resizeWidth
            ? const CircleBorder()
            : RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        fillColor: Colors.blue,
        onPressed: onPressed,
        child: Container(
          height: size.width < resizeWidth ? 45 : height ?? 56,
          constraints: size.width < resizeWidth
              ? const BoxConstraints(maxWidth: 45)
              : BoxConstraints(maxWidth: width! - 30),
          child: Center(
            child: size.width < resizeWidth
                ? const Icon(Icons.mode_edit_outline, color: Colors.white)
                : Text(
                    label ?? 'Post',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}


class Midbutton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final double? width;
  final double? height;
  const Midbutton({
    Key? key,
    required this.label,
    this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      fillColor: Colors.blue,
      onPressed: onPressed,
      child: Container(
        height: height ?? 20,
        constraints: BoxConstraints(maxWidth: width ?? 200),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              // fontSize: 18,
              // fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

