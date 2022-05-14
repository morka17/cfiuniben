import 'package:cfi_nexus/utils/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizeTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;

  const CustomizeTile({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(37.0, 0.0, 9.0, 0.0),
      child: InkWell(
        splashColor: AppColor.gold4,
        onTap: onTap,
        child: Container(
          // decoration: BoxDecoration(
          //   border: Border(bottom: BorderSide(color: Colors.grey),),
          // ),
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: <Widget>[
                  Icon(icon,
                  color:Colors.black54,
                  ),
                  Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Text(
                      text,
                      style: GoogleFonts.ubuntu(
                        fontSize: 16.0,
            
                      )
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_right, color: AppColor.gold4,)
            ],
          ),
        ),
      ),
    );
  }
}
