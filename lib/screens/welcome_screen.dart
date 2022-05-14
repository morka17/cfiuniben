import 'package:cfi_nexus/providers/welcome.dart';
import 'package:cfi_nexus/screens/bio_screen.dart';
import 'package:cfi_nexus/screens/home_screen.dart';
import 'package:cfi_nexus/utils/color_palette.dart';
import 'package:cfi_nexus/utils/textfield_validator.dart';
import 'package:cfi_nexus/widgets/input_field.dart';
import 'package:cfi_nexus/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static const _sizedBox = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool signin = context.watch<WelcomeView>().signIn;
    double s1 = size.width < 1020
        ? size.width * 0.3
        : size.width < 720
            ? 0
            : size.width * 0.4;
    double inputRatio = size.width < 720
        ? 1
        : size.width < 350
            ? 2
            : 0.64;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            size.width < 720
                ? Container()
                : Container(
                    height: size.height,
                    width: s1,
                    color: const Color(0XFFE5C100),
                  ),
            FormArea(
              size: size,
              s1: s1,
              inputRatio: inputRatio,
              sizedBox: _sizedBox,
              signin: signin,
            ),
          ],
        ),
      ),
    );
  }
}

class FormArea extends StatelessWidget {
  const FormArea({
    Key? key,
    required this.size,
    required this.s1,
    required this.inputRatio,
    required SizedBox sizedBox,
    required this.signin,
  })  : _sizedBox = sizedBox,
        super(key: key);

  final Size size;
  final double s1;
  final double inputRatio;
  final SizedBox _sizedBox;
  final bool signin;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final TextFieldValidator _validator = TextFieldValidator();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // height: size.height,
        width: size.width < 720 ? size.width : size.width - s1,
        color: Colors.white,
        child: Center(
          child: SizedBox(
            width: (size.width - s1) * inputRatio,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 12.0, top: size.width > 500 ? 5.0 : 10),
                    child: Text(
                      context.watch<WelcomeView>().signIn
                          ? 'Sign in'
                          : "Sign up",
                      style: GoogleFonts.ubuntu(fontSize: 25.0),
                    ),
                  ),
                  context.watch<WelcomeView>().signIn
                      ? Container()
                      : SizedBox(
                          width: (size.width - s1) * inputRatio,
                          child: size.width > 500
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          (size.width - s1) * inputRatio * 0.46,
                                      child: InputField(
                                        hintText: 'First Name',
                                        validator: _validator.forTextOnly,
                                        onChanged: (value) => context
                                            .read<WelcomeView>()
                                            .firstName = value,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          (size.width - s1) * inputRatio * 0.46,
                                      child: InputField(
                                        hintText: 'Last Name',
                                        validator: _validator.forTextOnly,
                                        onChanged: (value) => context
                                            .read<WelcomeView>()
                                            .lastName = value,
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      width: (size.width - s1) * inputRatio,
                                      child: InputField(
                                        hintText: 'First Name',
                                        validator: _validator.forTextOnly,
                                        onChanged: (value) => context
                                            .read<WelcomeView>()
                                            .firstName = value,
                                      ),
                                    ),
                                    _sizedBox,
                                    SizedBox(
                                      width: (size.width - s1) * inputRatio,
                                      child: InputField(
                                        hintText: 'Last Name',
                                        validator: _validator.forTextOnly,
                                        onChanged: (value) => context
                                            .read<WelcomeView>()
                                            .lastName = value,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                  _sizedBox,
                  SizedBox(
                    width: (size.width - s1) * inputRatio,
                    child: InputField(
                      hintText: 'Email',
                      validator: _validator.forEmailOnly,
                      onChanged: (value) =>
                          context.read<WelcomeView>().email = value,
                    ),
                  ),
                  _sizedBox,
                  SizedBox(
                    width: (size.width - s1) * inputRatio,
                    child: InputField(
                      obsure: true,
                      hintText: 'Password',
                      validator: _validator.forPassword,
                    ),
                  ),
                  _sizedBox,
                  context.watch<WelcomeView>().signIn
                      ? Container()
                      : SizedBox(
                          width: (size.width - s1) * inputRatio,
                          child: InputField(
                            obsure: true,
                            hintText: 'Confirm password',
                            validator: _validator.forConfirmPassword,
                            onChanged: (value) =>
                                context.read<WelcomeView>().password = value,
                          ),
                        ),
                  _sizedBox,
                  context.watch<WelcomeView>().signIn
                      ? Text(
                          "Forgot password?",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, color: Colors.blue),
                        )
                      : Container(),
                  _sizedBox,
                  RawMaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        loading(context);
                        await Future.delayed(const Duration(seconds: 2));
                        Navigator.pop(context.read<WelcomeView>().loadingContext);
                        // Navigator.pushNamed(context, BioScreen.id);
                         Get.off(() => signin ? const HomeScreen() : const BioScreen());
                      }
                    },
                    splashColor: AppColor.gold4,
                    hoverColor: AppColor.gold4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.gold3,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      constraints: BoxConstraints(
                          maxHeight: 50,
                          maxWidth: (size.width - s1) * inputRatio),
                      child: SizedBox(
                        width: (size.width - s1) * inputRatio,
                        height: 50,
                        child: Center(
                          child: Text(
                            signin ? "Sign in" : "Sign up",
                            style: GoogleFonts.ubuntu(
                                color: Colors.white, fontSize: 17.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.width > 500 ? 20.0 : 15.0,
                  ),
                  SizedBox(
                    width: (size.width - s1) * inputRatio,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (size.width - s1) * inputRatio * 0.45,
                          height: 1,
                          child: Container(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: Text(
                            "or",
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          width: (size.width - s1) * inputRatio * 0.45,
                          height: 1,
                          child: Container(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.width > 500 ? 20.0 : 15),
                    width: (size.width - s1) * inputRatio,
                    height: 50,
                    child: SignInButton(Buttons.Google, onPressed: () {
                      // context.read<WelcomeView>().googleSign(context);
                      // Navigator.pushNamed(context, SignInDemo.id);
                    },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  _sizedBox,
                  Container(
                    margin: EdgeInsets.only(
                        top: size.width > 500 ? 30 : 10, bottom: 5.0),
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: () =>
                          context.read<WelcomeView>().changeView(!signin),
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.ubuntuCondensed(
                            color: Colors.black,
                            fontSize: size.width < 500 ? 14 : 17.0,
                          ),
                          children: [
                            TextSpan(
                                text: signin
                                    ? "Don't have account? "
                                    : "Already have an account? "),
                            TextSpan(
                              text: signin ? "Sign up" : "Sign in",
                              style: const TextStyle(
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
