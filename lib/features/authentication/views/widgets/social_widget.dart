import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../cores/utils/sizer_utils.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _iconItem('assets/icons/fb.svg', const Color(0xff1877F2)),
        horizontalSpace(5),
        _iconItem('assets/icons/google.svg', const Color(0xFFFFFFFF)),
        horizontalSpace(5),
        _iconItem('assets/icons/apple.svg', const Color(0xff282A3A)),
      ],
    );
  }

  Container _iconItem(String imagePath, Color bgColor) {
    return Container(
      height: sp(48),
      width: sp(48),
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Container(
        padding: EdgeInsets.all(sp(10)),
        child: SvgPicture.asset(imagePath),
      ),
    );
  }
}
