import 'package:cfi_nexus/views/cfi_bio.dart';
import 'package:cfi_nexus/views/pro_bio.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:cfi_nexus/providers/bio.dart';
import 'package:cfi_nexus/widgets/nav_button.dart';

class HomeBioView extends StatelessWidget {
  static const _kSizedBox = SizedBox(height: 20);

  const HomeBioView({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double s1 = size.width < 700 ? 0 : size.width * 0.4;
    double inputRatio = size.width < 500 ? 0.8 : 0.7;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            "Home",
            style: GoogleFonts.ubuntu(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _kSizedBox,
        SizedBox(
          width: (size.width - s1) * inputRatio,
          child: CSCPicker(
            
            layout: Layout.vertical,
            currentCity: context.watch<BioView>().city,
            currentState: context.watch<BioView>().state,
            currentCountry: context.watch<BioView>().country,
            onCityChanged: (value) => context.read<BioView>().setCity(value),
            onStateChanged: (value) => context.read<BioView>().setState(value),
            onCountryChanged: (value) => context.read<BioView>().setCountry(value),
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
                    context.read<BioView>().changeView(CfiBioView(), 2),
              ),
              NavBtn(label: 'Next', onPressed: () => context.read<BioView>().changeView(ProBioView(), 4)),
            ],
          ),
        ),
      ],
    );
  }
}
