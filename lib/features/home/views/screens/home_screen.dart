import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../cores/components/app_bar_widget.dart';
import '../../../../cores/components/custom_scaffold_widget.dart';
import '../../../../cores/utils/sizer_utils.dart';
import '../widgets/feed_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      useSingleScroll: false,
      usePadding: false,
      body: Column(
        children: <Widget>[
          verticalSpace(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sp(20)),
            child: AppBarWidget(
              centered: false,
              trilling: SvgPicture.asset('assets/icons/message.svg'),
            ),
          ),
          const Flexible(child: FeedListViewWidget()),
        ],
      ),
    );
  }
}
