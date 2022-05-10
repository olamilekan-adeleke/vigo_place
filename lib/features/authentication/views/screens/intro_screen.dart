import 'package:flutter/material.dart';
import '../../../../cores/components/app_bar_widget.dart';
import '../../../../cores/components/custom_scaffold_widget.dart';


import '../../../../cores/utils/sizer_utils.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      body: Column(
        children: <Widget>[
          verticalSpace(),
         const AppBarWidget(),
        ],
      ),
    );
  }
}
