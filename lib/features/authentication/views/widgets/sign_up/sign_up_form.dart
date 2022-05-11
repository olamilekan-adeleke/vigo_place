import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../cores/components/custom_text_widget.dart';
import '../../../../../cores/components/custom_textfiled.dart';
import '../../../../../cores/constants/color.dart';
import '../../../../../cores/utils/sizer_utils.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextWidget(
          'Sign up to gain access',
          fontSize: sp(19),
          fontWeight: FontWeight.w700,
          textColor: kcPrimaryColor,
        ),
        verticalSpace(30),
        CustomTextField(
          prefix: Padding(
            padding: EdgeInsets.all(sp(10)),
            child: SvgPicture.asset('assets/icons/person.svg'),
          ),
          hintText: 'Fullname',
          onChanged: (_) {},
        ),
        verticalSpace(20),
        CustomTextField(
          prefix: Padding(
            padding: EdgeInsets.all(sp(10)),
            child: SvgPicture.asset('assets/icons/person.svg'),
          ),
          hintText: 'Username',
          onChanged: (_) {},
        ),
        verticalSpace(20),
        CustomTextField(
          prefix: Padding(
            padding: EdgeInsets.all(sp(10)),
            child: SvgPicture.asset('assets/icons/envelope.svg'),
          ),
          hintText: 'Email',
          onChanged: (_) {},
        ),
        verticalSpace(20),
        CustomTextField(
          prefix: Padding(
            padding: EdgeInsets.all(sp(10)),
            child: SvgPicture.asset('assets/icons/calendar.svg'),
          ),
          hintText: 'May 30, 2001',
          onChanged: (_) {},
        ),
        verticalSpace(20),
        CustomTextField(
          prefix: Padding(
            padding: EdgeInsets.all(sp(10)),
            child: SvgPicture.asset('assets/icons/lock.svg'),
          ),
          hintText: 'Password',
          isPassword: true,
          onChanged: (_) {},
        ),
        verticalSpace(20),
        CustomTextField(
          prefix: Padding(
            padding: EdgeInsets.all(sp(10)),
            child: SvgPicture.asset('assets/icons/lock.svg'),
          ),
          hintText: 'Confirm password',
          isPassword: true,
          onChanged: (_) {},
        ),
        verticalSpace(22),
        CheckboxListTile(
          value: true,
          title: TwoSpanTextWidget(
            "I agree to the",
            'Terms of Service and Privacy Policy',
            fontWeight: FontWeight.w700,
            firstFontWeight: FontWeight.w400,
            fontSize: sp(14),
          ),
          onChanged: (_) {},
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ],
    );
  }
}
