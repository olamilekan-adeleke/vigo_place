import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/color.dart';
import '../navigator/app_router.dart';
import '../utils/sizer_utils.dart';
import 'image_widget.dart';

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
      padding: EdgeInsets.only(top: sp(20), bottom: sp(10)),
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
          SizedBox(
            height: sp(height),
            width: sp(width),
            child: const CustomImageWidget(
              imageUrl: 'assets/icons/app_name.png',
              imageTypes: ImageTypes.asset,
            ),
          ),
          trilling ?? Container(),
        ],
      ),
    );
  }
}
