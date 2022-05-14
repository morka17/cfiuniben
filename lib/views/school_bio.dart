import 'package:cfi_nexus/providers/bio.dart';
import 'package:cfi_nexus/utils/textfield_validator.dart';
import 'package:cfi_nexus/views/cfi_bio.dart';
import 'package:cfi_nexus/widgets/input_field.dart';
import 'package:cfi_nexus/widgets/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SchoolBioView extends StatelessWidget {
  static const _kSizedBox = SizedBox(height: 20);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final TextFieldValidator _validator = TextFieldValidator();

  const SchoolBioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double s1 = size.width < 700 ? 0 : size.width * 0.4;
    double inputRatio = size.width < 500 ? 0.8 : 0.7;
    final _bioView = context.read<BioView>();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "School",
              style: GoogleFonts.ubuntu(
                  fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
          ),
          _kSizedBox,
          SizedBox(
            width: (size.width - s1) * inputRatio,
            child: InputField(
              initialValue: _bioView.faculty,
              hintText: "Faculty",
              validator: _validator.forTextOnly,
              onChanged: (value) => _bioView.faculty = value,
            ),
          ),
          _kSizedBox,
          SizedBox(
            width: (size.width - s1) * inputRatio,
            child: InputField(
              initialValue: _bioView.department,
              hintText: "Department",
              validator: _validator.forTextOnly,
              onChanged: (value) => context.read<BioView>().department = value,
            ),
          ),
          _kSizedBox,
          SizedBox(
            width: (size.width - s1) * inputRatio,
            child: InputField(
              initialValue: _bioView.address,
              hintText: "Resident address",
              validator: _validator.forTextOnly,
              onChanged: (value) => context.read<BioView>().address = value,
            ),
          ),
          _kSizedBox,
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 8.0),
            width: (size.width - s1) * inputRatio,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                NavBtn(
                  label: 'Next',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<BioView>().changeView(const CfiBioView(), 2);
                    } else {
                      // print("not valid");
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
