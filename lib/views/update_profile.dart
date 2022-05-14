import 'package:cfi_nexus/providers/home.dart';
import 'package:cfi_nexus/providers/profile.dart';
import 'package:cfi_nexus/utils/view_border.dart';
import 'package:cfi_nexus/views/profile_view.dart';
import 'package:cfi_nexus/widgets/Default_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileUpdateView extends StatelessWidget {
  const ProfileUpdateView({Key? key}) : super(key: key);

  double reSizeWidth(context) {
    Size size = MediaQuery.of(context).size;
    double maxWidth = size.width < 1500 ? size.width : 1300;

    if (size.width <= 500)
      return maxWidth;
    else if (size.width < 700)
      return maxWidth * 0.85;
    else if (size.width < 770)
      return maxWidth * 0.77;
    else if (size.width < 950)
      return maxWidth * 0.70;
    else if (size.width < 1020) return maxWidth * 0.60;
    return maxWidth * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = reSizeWidth(context);
    var d = context.watch<Updater>();
    return Container(
      // height: size.height,
      width: width,
      decoration: kviewBorder,
      child: Column(
        children: [
          DefaultNavBar(
            label: "Change ${d.title.toLowerCase()}",
            onPressed: ()=> context.read<HomeView>().changeView(ProfileView()),
          ),
          Container(
            // height: size.height <= 500 ? null : size.height - 50,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    // key: _formKey,
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 500),
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(top: 20.0, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          EditTitle(
                            editTiteId: 'Current',
                            color: Colors.grey[500],
                          ),
                          Container(
                            constraints: BoxConstraints(
                              minHeight: 60.0,
                              minWidth: size.width,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(left: 7.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                d.value,
                                style: GoogleFonts.ubuntuTextTheme()
                                    .headline4!
                                    .copyWith(
                                      fontSize: 17.0,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          EditTitle(
                            editTiteId: "New",
                          ),
                          TextFormField(
                              // initialValue: currentValue,
                              // validator: _validator.forTextOnly,
                              // onChanged: (value) => newValue = value,
                              )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditTitle extends StatelessWidget {
  const EditTitle({
    Key? key,
    required this.editTiteId,
    this.color,
  }) : super(key: key);

  final String editTiteId;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 10.0),
      child: Text(
        editTiteId,
        style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w400,
          color: color,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
