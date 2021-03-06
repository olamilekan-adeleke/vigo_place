// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../cores/constants/color.dart';
import '../utils/sizer_utils.dart';
import 'custom_circular_progress_indicator.dart';
import 'custom_text_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.textSize = 16,
    this.height,
    this.width,
    this.textFontWeight = FontWeight.w700,
    this.circular = false,
  })  : busy = false,
        iconData = null,
        iconSize = null,
        iconColor = null;

  const CustomButton.loading({
    this.onTap,
    this.color,
    this.height,
    this.width,
  })  : busy = true,
        iconData = null,
        text = null,
        textColor = null,
        textSize = 16,
        textFontWeight = null,
        iconSize = null,
        iconColor = null,
        circular = false;

  const CustomButton.smallSized({
    this.text,
    this.onTap,
    this.color,
    this.textColor,
    this.textSize = 16,
    this.height,
    this.width,
    this.textFontWeight,
    this.circular = false,
  })  : busy = false,
        iconData = null,
        iconSize = null,
        iconColor = null;

  const CustomButton.icon({
    required this.iconData,
    required this.height,
    required this.width,
    this.onTap,
    this.color,
    this.iconColor,
    this.iconSize,
    this.circular = false,
  })  : busy = false,
        text = null,
        textColor = null,
        textSize = 16,
        textFontWeight = null;

  final String? text;
  final IconData? iconData;
  final void Function()? onTap;
  final bool busy;
  final Color? color;
  final Color? textColor;
  final double textSize;
  final double? height;
  final double? width;
  final FontWeight? textFontWeight;
  final Color? iconColor;
  final double? iconSize;
  final bool circular;

  @override
  Widget build(BuildContext context) {
    const double __defaultHeight = 45.0;
    final double __defaultWidth = MediaQuery.of(context).size.width * 0.95;

    Widget child;

    if (text == null) {
      if (busy) {
        child = const CustomCircularProgressIndicator(color: kcPrimaryColor);
      } else {
        child = Icon(
          iconData,
          color: iconColor ?? Colors.white,
          size: iconSize ?? 20.0,
        );
      }
    } else {
      child = TextWidget(
        text ?? 'no text',
        textColor: textColor ?? Colors.white,
        fontSize: sp(textSize),
        fontWeight: textFontWeight,
      );
    }

    return SizedBox(
      height: height ?? __defaultHeight,
      width: width ?? __defaultWidth,
      child: TextButton(
        onPressed: () => onTap!(),
        style: ButtonStyle(
          shape: circular
              ? MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sp(100.0)),
                  ),
                )
              : MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sp(10.0)),
                  ),
                ),
          backgroundColor: busy
              ? MaterialStateProperty.all(kcGrey100)
              : MaterialStateProperty.all(color ?? kcPrimaryColor),
        ),
        child: child,
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  const BorderButton({
    Key? key,
    this.text,
    this.onTap,
    this.busy = false,
    this.borderColor = kcTextColor,
    this.textColor,
    this.textSize = 16,
    this.height,
    this.width,
    this.textFontWeight = FontWeight.w700,
  }) : super(key: key);

  final String? text;
  final void Function()? onTap;
  final bool busy;
  final Color? borderColor;
  final Color? textColor;
  final double textSize;
  final double? height;
  final double? width;

  final FontWeight? textFontWeight;

  @override
  Widget build(BuildContext context) {
    const double __defaultHeight = 45.0;
    final double __defaultWidth = MediaQuery.of(context).size.width * 0.95;

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: height ?? __defaultHeight,
        width: width ?? __defaultWidth,
        padding: EdgeInsets.symmetric(horizontal: sp(15), vertical: sp(5)),
        decoration: BoxDecoration(
          color: kcWhite,
          borderRadius: BorderRadius.circular(sp(10)),
          border: Border.all(color: borderColor ?? kcWhite),
        ),
        child: busy
            ? const Center(
                child: CustomCircularProgressIndicator(
                  color: kcPrimaryColor,
                ),
              )
            : Center(
                child: TextWidget(
                  text ?? 'no text',
                  textColor: textColor,
                  fontSize: sp(textSize),
                  fontWeight: textFontWeight,
                ),
              ),
      ),
    );
  }
}
