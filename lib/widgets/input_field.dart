import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cfi_nexus/utils/color_palette.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obsure;
  final String? initialValue;
  const InputField({
    Key? key,
    required this.hintText,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.obsure, this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: Colors.black54,
      initialValue: initialValue,
      obscureText: obsure ?? false,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: GoogleFonts.ubuntu(color: AppColor.gold3),
        hintText: hintText,
        // focusColor:
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(width: 1.0, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(width: 1.0, color: AppColor.gold2),
        ),
      ),
    );
  }
}
