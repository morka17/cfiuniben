import 'package:cfi_nexus/utils/textfield_validator.dart';
import 'package:cfi_nexus/views/home_bio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:cfi_nexus/providers/bio.dart';
import 'package:cfi_nexus/utils/input_decoration.dart';
import 'package:cfi_nexus/utils/list.dart';
import 'package:cfi_nexus/views/school_bio.dart';
import 'package:cfi_nexus/widgets/nav_button.dart';

class CfiBioView extends StatelessWidget {
  static const _kSizedBox = SizedBox(height: 20);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final TextFieldValidator _validator = TextFieldValidator();

  const CfiBioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double s1 = size.width < 700 ? 0 : size.width * 0.4;
    double inputRatio = size.width < 500 ? 0.8 : 0.7;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "CFI",
              style: GoogleFonts.ubuntu(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _kSizedBox,
          SizedBox(
            width: (size.width - s1) * inputRatio,
            child: DropdownButtonFormField(
              validator: _validator.forCell,
              decoration: KinputDecoration.copyWith(
                labelText: 'Cell',
                hintText: 'Cell',
              ),
              items: cells.map((Cell cell) {
                return DropdownMenuItem<Cell>(
                  value: cell,
                  child: Text(cell.name),
                );
              }).toList(),
              onChanged: (value) {
                context.read<BioView>().cell = (value as Cell).name;
              },
            ),
          ),
          _kSizedBox,
          SizedBox(
            width: (size.width - s1) * inputRatio,
            child: DropdownButtonFormField(
              validator: _validator.forUnit,
              decoration: KinputDecoration.copyWith(
                labelText: 'Unit',
                hintText: 'Unit',
              ),
              items: units.map((Unit unit) {
                return DropdownMenuItem(
                  value: unit,
                  child: Text(
                    unit.name,
                    style: GoogleFonts.ubuntu(
                        fontSize: size.width < 280 ? 12 : null),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                context.read<BioView>().unit = (value as Unit).name;
              },
            ),
          ),
          _kSizedBox,
          SizedBox(
            width: (size.width - s1) * inputRatio,
            child: DropdownButtonFormField(
              // validator: _validator.forTextOnly,
              decoration: KinputDecoration.copyWith(
                errorStyle: const TextStyle(color: Colors.red),
                labelText: 'Alumni?',
                hintText: 'Alumni?',
              ),
              items: answers.map((Answer answer) {
                return DropdownMenuItem(
                  value: answer,
                  child: Text(answer.answer),
                );
              }).toList(),
              onChanged: (value) {
                context.read<BioView>().isAlumni = (value as Answer).answer;
              },
            ),
          ),
          _kSizedBox,
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 8.0),
            width: (size.width - s1) * inputRatio,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NavBtn(
                  label: 'Back',
                  onPressed: () =>
                      context.read<BioView>().changeView(SchoolBioView(), 1),
                ),
                NavBtn(
                    label: 'Next',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<BioView>().changeView(const HomeBioView(), 3);
                      } else{}
                       // print("not valid");
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
