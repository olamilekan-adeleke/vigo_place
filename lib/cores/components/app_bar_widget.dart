import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/color.dart';
import '../navigator/app_router.dart';
import '../utils/sizer_utils.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    this.width = 120,
    this.height = 24,
    this.showBackButton = true,
    this.trilling,
  }) : super(key: key);

  final double width;
  final double height;
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
          SvgPicture.asset(
            'assets/icons/app_name.svg',
            height: sp(height),
            width: sp(width),
          ),
          trilling ?? Container(),
        ],
      ),
    );
  }
}
