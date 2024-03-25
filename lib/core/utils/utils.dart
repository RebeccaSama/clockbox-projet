import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils {
  static void showSnackBar(
      {required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          content,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void showToast(BuildContext context,
      {String content = "Une erreur est survenue", bool isError = true}) {
    var fToast = FToast();
    fToast.init(context);

    fToast.showToast(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: isError ? Colors.redAccent : Colors.greenAccent,
          ),
          alignment: Alignment.center,
          child: Text(
            content,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        
        positionedToastBuilder: (context, child) {
          return Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            child: child,
          );
        },
        toastDuration: const Duration(seconds: 2));
  }

  static Future<T?> showCustomDialog<T>(
      {required BuildContext context,
      bool canPop = true,
      Color? backgroundColor,
      EdgeInsets insetPadding =
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      double blur = 6,
      double? borderRadius,
      required Widget Function(BuildContext ctx) child}) {
    return showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext ctx) {
          return ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: WillPopScope(
                onWillPop: () async {
                  return canPop;
                },
                child: Dialog(
                  backgroundColor: backgroundColor,
                  insetPadding: insetPadding,
                  shape: borderRadius == null
                      ? null
                      : RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius)),
                  child: child(ctx),
                ),
              ),
            ),
          );
        });
  }

  static Color adjustColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
  }

}
