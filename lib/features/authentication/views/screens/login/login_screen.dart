import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../cores/components/app_bar_widget.dart';
import '../../../../../cores/components/custom_button.dart';
import '../../../../../cores/components/custom_scaffold_widget.dart';
import '../../../../../cores/components/custom_text_widget.dart';
import '../../../../../cores/components/custom_textfiled.dart';
import '../../../../../cores/constants/color.dart';
import '../../../../../cores/navigator/app_router.dart';
import '../../../../../cores/utils/sizer_utils.dart';
import '../../../../home/views/screens/home_screen.dart';
import '../../widgets/social_widget.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        children: <Widget>[
          verticalSpace(),
          const AppBarWidget(),
          verticalSpace(40),
          TextWidget(
            'Login to continue',
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
            hintText: 'Username or email address',
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
          verticalSpace(22),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  value: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: TextWidget('Remember me', fontSize: sp(14)),
                  onChanged: (_) {},
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextWidget(
                    'Forgot Password?',
                    fontSize: sp(14),
                    fontWeight: FontWeight.w700,
                    textColor: kcPrimaryColor,
                  ),
                ),
              )
            ],
          ),
          verticalSpace(30),
          CustomButton(
            text: 'Login',
            onTap: () {
              AppRouter.instance.navigateTo(HomeScreen.route);
            },
          ),
          verticalSpace(30),
          TextWidget(
            'OR LOGIN WITH',
            fontSize: sp(11),
            fontWeight: FontWeight.w600,
          ),
          verticalSpace(20),
          const SocialWidget(),
          const Spacer(),
          GestureDetector(
            onTap: () {
              AppRouter.instance.navigateTo(SignUpScreen.route);
            },
            child: TwoSpanTextWidget(
              "Don't have an account yet? ",
              'Sign up',
              fontWeight: FontWeight.w700,
              firstFontWeight: FontWeight.w400,
              fontSize: sp(14),
            ),
          ),
          verticalSpace(40),
        ],
      ),
    );
  }
}
