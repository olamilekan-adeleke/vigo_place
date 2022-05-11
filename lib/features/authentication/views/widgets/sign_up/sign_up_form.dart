import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../../cores/components/custom_button.dart';
import '../../../../../cores/components/custom_text_widget.dart';
import '../../../../../cores/components/custom_textfiled.dart';
import '../../../../../cores/constants/color.dart';
import '../../../../../cores/utils/date_time_picker.dart';
import '../../../../../cores/utils/sizer_utils.dart';
import '../../../../../cores/utils/snack_bar_service.dart';
import '../../../../../cores/utils/status_enum.dart';
import '../../../../../cores/utils/validator.dart';
import '../../../cubit/sign_up_cubit.dart';
import '../../../models/sign_up/sign_up_state_model.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final SignUpCubit signUpCubit = context.read<SignUpCubit>();

    return Form(
      key: _formKey,
      child: Column(
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
            validator: nameValidator,
            onChanged: signUpCubit.onFullnameChanged,
          ),
          verticalSpace(20),
          CustomTextField(
            prefix: Padding(
              padding: EdgeInsets.all(sp(10)),
              child: SvgPicture.asset('assets/icons/person.svg'),
            ),
            hintText: 'Username',
            validator: nameValidator,
            onChanged: signUpCubit.onUsernameChanged,
          ),
          verticalSpace(20),
          CustomTextField(
            prefix: Padding(
              padding: EdgeInsets.all(sp(10)),
              child: SvgPicture.asset('assets/icons/envelope.svg'),
            ),
            hintText: 'Email',
            validator: emailValidator,
            onChanged: signUpCubit.onEmailChanged,
          ),
          verticalSpace(20),
          BlocBuilder<SignUpCubit, SignUpStateModel>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () async {
                  final DateTime? date =
                      await DateTimePickerHelper.pickDate(context);

                  if (date == null) return;

                  final String formatData =
                      DateFormat('MMM dd, yyyy').format(date);

                  signUpCubit.onDobChanged(formatData);
                },
                child: CustomTextField(
                  prefix: Padding(
                    padding: EdgeInsets.all(sp(10)),
                    child: SvgPicture.asset('assets/icons/calendar.svg'),
                  ),
                  hintText: state.dob.isEmpty ? 'May 30, 2001' : state.dob,
                  enabled: false,
                  validator: dobValidator,
                  onChanged: signUpCubit.onDobChanged,
                ),
              );
            },
          ),
          verticalSpace(20),
          CustomTextField(
            prefix: Padding(
              padding: EdgeInsets.all(sp(10)),
              child: SvgPicture.asset('assets/icons/lock.svg'),
            ),
            hintText: 'Password',
            isPassword: true,
            validator: passwordValidator,
            onChanged: signUpCubit.onPasswordChanged,
          ),
          verticalSpace(20),
          CustomTextField(
            prefix: Padding(
              padding: EdgeInsets.all(sp(10)),
              child: SvgPicture.asset('assets/icons/lock.svg'),
            ),
            hintText: 'Confirm password',
            isPassword: true,
            validator: (val) => confirmPasswordValidator(
              val,
              signUpCubit.state.password,
            ),
            onChanged: (_) {},
          ),
          verticalSpace(22),
          BlocBuilder<SignUpCubit, SignUpStateModel>(
            builder: (context, state) {
              return CheckboxListTile(
                value: state.isAccepted,
                title: TwoSpanTextWidget(
                  "I agree to the",
                  'Terms of Service and Privacy Policy',
                  fontWeight: FontWeight.w700,
                  firstFontWeight: FontWeight.w400,
                  fontSize: sp(14),
                ),
                onChanged: signUpCubit.onIsAcceptedChanged,
                controlAffinity: ListTileControlAffinity.leading,
              );
            },
          ),
          verticalSpace(30),
          BlocBuilder<SignUpCubit, SignUpStateModel>(
            builder: (context, state) {
              if (state.status == StatusEnum.busy) {
                return const CustomButton.loading();
              }

              return CustomButton(
                text: 'Sign up',
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false == false) {
                    return;
                  }

                  if (signUpCubit.state.isAccepted == false) {
                    return SnackBarService.showWarningSnackBar(
                      context: context,
                      message:
                          'Please agree to our Terms of Service and Privacy'
                          ' Policy by click the "Terms of Service and Privacy Policy" check box',
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
