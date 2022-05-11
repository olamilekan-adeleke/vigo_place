import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../cores/components/custom_button.dart';
import '../../../../../cores/components/custom_text_widget.dart';
import '../../../../../cores/components/custom_textfiled.dart';
import '../../../../../cores/constants/color.dart';
import '../../../../../cores/utils/sizer_utils.dart';
import '../../cubit/login_cubit.dart';
import '../../models/login/login_state_model.dart';

class LoginFromWidget extends StatelessWidget {
  const LoginFromWidget({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LoginCubit loginCubit = context.read<LoginCubit>();

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
            onChanged: loginCubit.onUsernameChanged,
          ),
          verticalSpace(20),
          CustomTextField(
            prefix: Padding(
              padding: EdgeInsets.all(sp(10)),
              child: SvgPicture.asset('assets/icons/lock.svg'),
            ),
            hintText: 'Password',
            isPassword: true,
            onChanged: loginCubit.onPasswordChanged,
          ),
          verticalSpace(22),
          Row(
            children: [
              Expanded(
                child: BlocBuilder<LoginCubit, LoginStateModel>(
                  builder: (context, state) {
                    return CheckboxListTile(
                      value: state.rememberMe,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: TextWidget('Remember me', fontSize: sp(14)),
                      onChanged: loginCubit.onRememberMeChanged,
                    );
                  },
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextWidget(
                    'Forgot Password?   ',
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
              if (_formKey.currentState?.validate() ?? false) {
                loginCubit.onFormSubmitted();
              }
            },
          ),
        ],
      ),
    );
  }
}
