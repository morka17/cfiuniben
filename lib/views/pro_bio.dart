import 'package:cfi_nexus/providers/bio.dart';
import 'package:cfi_nexus/screens/home_screen.dart';
import 'package:cfi_nexus/utils/textfield_validator.dart';
import 'package:cfi_nexus/views/home_bio.dart';
import 'package:cfi_nexus/widgets/input_field.dart';
import 'package:cfi_nexus/widgets/loading_indicator.dart';
import 'package:cfi_nexus/widgets/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProBioView extends StatelessWidget {
  static const _kSizedBox = SizedBox(height: 20);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final TextFieldValidator _validator = TextFieldValidator();

  const ProBioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = context.watch<BioView>().image;
    Size size = MediaQuery.of(context).size;
    double s1 = size.width < 700 ? 0 : size.width * 0.4;
    double inputRatio = size.width < 500 ? 0.8 : 0.7;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Profile",
                style: GoogleFonts.ubuntu(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _kSizedBox,
            InkWell(
              onTap: () => context.read<BioView>().pickImage(context),
              borderRadius: BorderRadius.circular(30),
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 180,
                  maxWidth: 180,
                ),
                decoration: BoxDecoration(
                    image: image != null
                        ? DecorationImage(
                            image: FileImage(image), fit: BoxFit.fill)
                        : null,
                    border: Border.all(color: Colors.yellow, width: 3.0),
                    color: Colors.yellow.withAlpha(100),
                    borderRadius: BorderRadius.circular(100)),
                child: image != null
                    ? null
                    : const Center(
                        child: Icon(Icons.camera_enhance,
                            size: 50.0, color: Colors.green),
                      ),
              ),
            ),
            _kSizedBox,
            // Container(
            //   width: s1,
            //   child: Center(
            //     child: InkWell(
            //       onTap: () => context.read<BioView>().pickImage(context),
            //       child: CircleAvatar(
            //         backgroundImage: context.watch<BioView>().image,
            //         backgroundColor: const Color.fromARGB(219, 76, 240, 82),
            //         maxRadius: 80,
            //         child: const Icon(
            //           Icons.camera_enhance,
            //           size: 50.0,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              width: (size.width - s1) * inputRatio,
              child: InputField(
                initialValue: context.read<BioView>().preferName,
                hintText: "Prefer name",
                validator: _validator.forPreferName,
                onChanged: (value) =>
                    context.read<BioView>().preferName = value,
              ),
            ),
            _kSizedBox,
            SizedBox(
              width: (size.width - s1) * inputRatio,
              child: InputField(
                initialValue: context.read<BioView>().phoneNumber,
                hintText: "Phone number",
                keyboardType: TextInputType.phone,
                validator: _validator.forPhoneNumber,
                onChanged: (value) =>
                    context.read<BioView>().phoneNumber = value,
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
                    onPressed: () => context
                        .read<BioView>()
                        .changeView(const HomeBioView(), 3),
                  ),
                  NavBtn(
                    label: 'Submit',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (image == null) {
                          Get.snackbar('error', "Select a profile photo", backgroundColor: Colors.red, colorText: Colors.white);
                        }else{
                           loading(context);
                           await Future.delayed(const Duration(seconds: 3));
                           Get.back();
                           Get.offAllNamed(HomeScreen.id);
                        }
                      } else {}
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
