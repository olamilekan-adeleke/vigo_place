import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../navigator/app_router.dart';
import '../utils/sizer_utils.dart';
import 'custom_text_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
    this.title, {
    Key? key,
    this.showBackButton = true,
    this.trilling,
  }) : super(key: key);

  final String title;
  final bool showBackButton;
  final Widget? trilling;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: sp(15),
        right: sp(15),
        top: sp(20),
        bottom: sp(10),
      ),
      color: kcWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (showBackButton)
            GestureDetector(
              onTap: AppRouter.instance.goBack,
              child: Icon(Icons.arrow_back, size: sp(18)),
            )
          else
            Container(),
          TextWidget(title, fontSize: sp(21), fontWeight: FontWeight.w700),
          trilling ?? Container(),
        ],
      ),
    );
  }
}
