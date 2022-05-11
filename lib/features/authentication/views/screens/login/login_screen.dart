import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cores/components/app_bar_widget.dart';
import '../../../../../cores/components/custom_scaffold_widget.dart';
import '../../../../../cores/components/custom_text_widget.dart';
import '../../../../../cores/navigator/app_router.dart';
import '../../../../../cores/utils/sizer_utils.dart';
import '../../../../../cores/utils/snack_bar_service.dart';
import '../../../../../cores/utils/status_enum.dart';
import '../../../cubit/auth_state_cubit.dart';
import '../../../cubit/login_cubit.dart';
import '../../../models/login/login_state_model.dart';
import '../../widgets/login_form_widget.dart';
import '../../widgets/social_widget.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStateModel>(
      listener: (context, state) {
        if (state.status == StatusEnum.error) {
          SnackBarService.showErrorSnackBar(
            context: context,
            message: state.errorText,
          );
        } else if (state.status == StatusEnum.success) {
          SnackBarService.showSuccessSnackBar(
            context: context,
            message: 'Login Successful!',
          );

          context
              .read<AuthenticatedStateCubit>()
              .updateState(AuthenticatedStatus.authenticated);

          AppRouter.instance.goBack();
        }
      },
      child: CustomScaffoldWidget(
        body: SizedBox(
          height: sh(98),
          child: Column(
            children: <Widget>[
              verticalSpace(),
              const AppBarWidget(),
              verticalSpace(40),
              const LoginFromWidget(),
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
                  AppRouter.instance.navigateToAndReplace(SignUpScreen.route);
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
        ),
      ),
    );
  }
}
