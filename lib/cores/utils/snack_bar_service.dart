import 'package:flutter/material.dart';

import '../components/custom_text_widget.dart';
import '../constants/color.dart';

class SnackBarService {
  static void showErrorSnackBar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 5),
  }) {
    final snackBar = SnackBar(
      content: TextWidget(
        message,
        textColor: kcWhite,
        textAlign: TextAlign.left,
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration,
      backgroundColor: Colors.red,
      // action: SnackBarAction(
      //   label: 'dismiss',
      //   textColor: kcWhite,
      //   onPressed: () => hideSnackBar(context),
      // ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showSuccessSnackBar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    final snackBar = SnackBar(
      content: TextWidget(
        message,
        textColor: kcWhite,
        textAlign: TextAlign.left,
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration,
      backgroundColor: Colors.green,
      // action: SnackBarAction(
      //   label: 'dismiss',
      //   textColor: kcWhite,
      //   onPressed: () => hideSnackBar(context),
      // ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showWarningSnackBar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    final snackBar = SnackBar(
      content: TextWidget(
        message,
        textColor: kcWhite,
        textAlign: TextAlign.left,
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration,
      backgroundColor: Colors.grey.shade800,
      // action: SnackBarAction(
      //   label: 'dismiss',
      //   textColor: kcWhite,
      //   onPressed: () => hideSnackBar(context),
      // ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
