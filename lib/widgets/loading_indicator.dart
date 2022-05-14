import 'package:cfi_nexus/providers/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

void loading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      context.read<WelcomeView>().loadingContext = context;
      return SizedBox(
        width: 50,
        height: 50,
        child: Builder(
          // contentPadding: const EdgeInsets.all(0),
          builder: (context) => SpinKitThreeBounce(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.lightBlue : Colors.green,
                ),
              );
            },
          ),
        ),
      );
    },
  );
}

void progressLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      context.read<WelcomeView>().loadingContext = context;
      return SizedBox(
        width: 50,
        height: 50,
        child: Builder(
          // contentPadding: const EdgeInsets.all(0),
          builder: (context) => SpinKitCircle(
            size: 100,
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.lightBlue : Colors.green,
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
