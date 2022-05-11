import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cores/components/app_bar_widget.dart';
import '../../../../../cores/components/custom_scaffold_widget.dart';
import '../../../../../cores/components/custom_text_widget.dart';
import '../../../../../cores/navigator/app_router.dart';
import '../../../../../cores/utils/sizer_utils.dart';
import '../../../../../cores/utils/snack_bar_service.dart';
import '../../../../../cores/utils/status_enum.dart';
import '../../../cubit/sign_up_cubit.dart';
import '../../../models/sign_up/sign_up_state_model.dart';
import '../../widgets/sign_up/sign_up_form.dart';
import '../../widgets/social_widget.dart';
import '../login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const String route = '/signUp';

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpStateModel>(
      listener: (context, state) {
        if (state.status == StatusEnum.error) {
          SnackBarService.showErrorSnackBar(
            context: context,
            message: state.errorText,
          );
        } else if (state.status == StatusEnum.success) {
          SnackBarService.showSuccessSnackBar(
            context: context,
            message: 'Registration was successful, Login to proceed!',
          );

          AppRouter.instance.navigateToAndReplace(LoginScreen.route);
        }
      },
      child: CustomScaffoldWidget(
        body: Column(
          children: <Widget>[
            verticalSpace(),
            const AppBarWidget(),
            verticalSpace(60),
            const SignUpFormWidget(),
            verticalSpace(31),
            TextWidget(
              'OR LOGIN WITH',
              fontSize: sp(11),
              fontWeight: FontWeight.w600,
            ),
            verticalSpace(20),
            const SocialWidget(),
            verticalSpace(60),
            GestureDetector(
              onTap: () {
                AppRouter.instance.navigateToAndReplace(LoginScreen.route);
              },
              child: TwoSpanTextWidget(
                "Have an account already? ",
                'Login',
                fontWeight: FontWeight.w700,
                firstFontWeight: FontWeight.w400,
                fontSize: sp(14),
              ),
            ),
            verticalSpace(10),
          ],
        ),
      ),
    );
  }
}
