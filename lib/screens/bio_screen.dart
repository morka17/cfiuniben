import 'package:cfi_nexus/views/cfi_bio.dart';
import 'package:cfi_nexus/views/home_bio.dart';
import 'package:cfi_nexus/views/pro_bio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:cfi_nexus/providers/bio.dart';
import 'package:cfi_nexus/views/school_bio.dart';

class BioScreen extends StatefulWidget {
  static const String id = "/bio";
  const BioScreen({Key? key}) : super(key: key);

  @override
  _BioScreenState createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  @override
  Widget build(BuildContext context) {
    var _bio = context.watch<BioView>();
    Size size = MediaQuery.of(context).size;
    double s1 = size.width < 700 ? 0 : size.width * 0.4;
    double inputRatio = size.width < 500 ? 0.8 : 0.7;
    return Scaffold(
      appBar: size.width < 700
          ? AppBar(
              leading: null,
              toolbarHeight: 80,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BioIndicator(
                      index: "1",
                      onPressed: () => context
                          .read<BioView>()
                          .changeView(SchoolBioView(), 1)),
                 const BioIndicatorHR(),
                  BioIndicator(
                    index: "2",
                    onPressed: _bio.index == 2
                        ? () {
                            context
                                .read<BioView>()
                                .changeView(const CfiBioView(), 2);
                          }
                        : null,
                  ),
                  const BioIndicatorHR(),
                  BioIndicator(
                    index: "3",
                    onPressed: _bio.index == 3
                        ? () {
                            context
                                .read<BioView>()
                                .changeView(const HomeBioView(), 3);
                          }
                        : null,
                  ),
                ],
              ),
            )
          : null,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          children: <Widget>[
            size.width < 700
                ? Container()
                : Container(
                    height: size.height,
                    width: s1,
                    color: const Color(0XFFE5C100),
                    child: Container(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BioNav(
                            label: 'School',
                            index: '1',
                            onPressed: () => context
                                .read<BioView>()
                                .changeView(SchoolBioView(), 1),
                          ),
                          BioNav(
                            label: 'CFI',
                            index: '2',
                            onPressed: () => context
                                .read<BioView>()
                                .changeView(const CfiBioView(), 2),
                          ),
                          BioNav(
                            label: 'Home',
                            index: '3',
                            onPressed: () => context
                                .read<BioView>()
                                .changeView(const HomeBioView(), 3),
                          ),
                          BioNav(
                            label: 'Profile',
                            index: '4',
                            onPressed: () => context
                                .read<BioView>()
                                .changeView(const ProBioView(), 4),
                          ),
                        ],
                      ),
                    ),
                  ),
            SingleChildScrollView(
              child: SizedBox(
                width: size.width - s1,
                child: Center(
                  child: SizedBox(
                    width: (size.width - s1) * inputRatio,
                    child: _bio.view ?? SchoolBioView(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BioNav extends StatelessWidget {
  final String index;
  final String label;
  final void Function()? onPressed;
  const BioNav({
    Key? key,
    required this.index,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Column(
            children: [
              BioIndicator(
                index: index,
                onPressed: onPressed,
              ),
              index == '4' ? Container() : const BioIndicatorHR()
            ],
          ),
         const SizedBox(
            width: 10.0,
          ),
          Text(
            label,
            style: GoogleFonts.ubuntu(
                color: context.watch<BioView>().index.toString() == index
                    ? Colors.white
                    : Colors.white.withAlpha(200),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class BioIndicatorHR extends StatelessWidget {
 const  BioIndicatorHR({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Container(
        color: Colors.white,
        height: size.width < 700 ? 7 : 100.0,
        width: size.width < 700 ? size.width * 0.15 : 8,
      ),
    );
  }
}

class BioIndicator extends StatelessWidget {
  final String index;
  final void Function()? onPressed;
  const BioIndicator({
    Key? key,
    required this.index,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RawMaterialButton(
      constraints: BoxConstraints(
        minHeight: size.width < 270 ? 30 : 50.0,
        minWidth: size.width < 270 ? 30 : 50.0,
      ),
      elevation: 4.0,
      fillColor: Colors.green.withAlpha(40),
      shape: CircleBorder(
        side: BorderSide(
          color: Colors.white,
          width: context.watch<BioView>().index.toString() == index ? 5 : 3.0,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        index,
        style: GoogleFonts.ubuntu(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
