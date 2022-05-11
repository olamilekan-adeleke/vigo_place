import 'package:flutter/material.dart';
import 'package:vigo_place/cores/components/image_widget.dart';
import 'package:vigo_place/features/authentication/views/screens/login/login_screen.dart';
import '../../../../cores/components/app_bar_widget.dart';
import '../../../../cores/components/custom_button.dart';
import '../../../../cores/components/custom_scaffold_widget.dart';

import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/constants/color.dart';
import '../../../../cores/navigator/app_router.dart';
import '../../../../cores/utils/sizer_utils.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        children: <Widget>[
          verticalSpace(),
          const AppBarWidget(showBackButton: false),
          verticalSpace(50),
          SizedBox(
            height: sp(316),
            width: double.infinity,
            child: const CustomImageWidget(
              imageUrl: 'assets/images/intro_people.png',
              imageTypes: ImageTypes.asset,
            ),
          ),
          verticalSpace(35),
          SizedBox(
            height: sp(90),
            width: double.infinity,
            child: const CustomImageWidget(
              imageUrl: 'assets/images/build_text.png',
              imageTypes: ImageTypes.asset,
            ),
          ),
          verticalSpace(20),
          TextWidget(
            'Vigoplace integrates all of your personal, business and online interaction needs into one simple user-friendly application.',
            fontSize: sp(16),
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
          verticalSpace(40),
          CustomButton(
            text: 'Login',
            onTap: () {
              AppRouter.instance.navigateTo(LoginScreen.route);
            },
          ),
          verticalSpace(20),
          BorderButton(
            text: 'Sign Up',
            textColor: kcPrimaryColor,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
