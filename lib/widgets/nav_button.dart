import 'package:cfi_nexus/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class NavBtn extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const NavBtn({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
        AppColor.gold3,
      )),
      onPressed: onPressed,
      child: Text(
        label,
        style: GoogleFonts.ubuntu(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
