// import 'package:adaptive_dialog/adaptive_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthException {
//  static void handleFirebaseException(FirebaseException e, context) {
//     if (e.code == 'invalid-email')
//       showOkAlertDialog(
//         context: context,
//         title: "Error",
//         message: "The email is address is not valid",
//         useActionSheetForCupertino: true,
//       );
//     else if (e.code == 'user-disabled')
//       showOkAlertDialog(
//         context: context,
//         title: "Error",
//         message: 'The user corresponding to the given email has been disabled',
//         useActionSheetForCupertino: true,
//       );
//     else if (e.code == 'user-not-found')
//        showOkAlertDialog(
//          context: context,
//          title: 'Error',
//          message: 'No user corresponding to the given  email.',
//          useActionSheetForCupertino: true
//        );
//     else if (e.code == 'wrong-password')
//       showOkAlertDialog(
//         context: context,
//         title: "error",
//         message: "The password is invalid for the given email, or the account",
//         useActionSheetForCupertino: true
//       );
//     else if (e.code == 'email-already-in-use')
//       showOkAlertDialog(
//         context: context,
//         title: 'Error',
//         message: "This email already exist",
//         useActionSheetForCupertino: true,
//       );
//     else if (e.code  == 'operation-not-allowed')
//       showOkAlertDialog(
//         context: context,
//         title: 'Error',
//         message: 'Email or password accounts are not enabled',
//         useActionSheetForCupertino: true
//       );
//     else
//       showOkAlertDialog(
//         context: context,
//         title: 'Error',
//         message: "Oop!, something went wrong",
//         useActionSheetForCupertino: true
//       );
//   }
// }
