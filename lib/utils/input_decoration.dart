import 'package:flutter/material.dart';
import 'package:cfi_nexus/utils/color_palette.dart';

const KinputDecoration = InputDecoration(
  labelText: null,
  hintText: "First Name",
  focusColor: Colors.green,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 1.0, color: Color(0XFFE5C100),),
  ),
  border: OutlineInputBorder(borderRadius: BorderRadius.horizontal()),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.gold2, width: 2.0),
  ),
);
