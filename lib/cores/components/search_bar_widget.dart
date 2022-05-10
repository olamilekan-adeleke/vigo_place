import 'package:flutter/cupertino.dart';

import '../utils/sizer_utils.dart';
import 'custom_text_widget.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
    this.hintText,
  }) : super(key: key);

  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: sp(10)),
      height: sp(52),
      decoration: BoxDecoration(
        color: const Color(0xff1F1F1F),
        borderRadius: BorderRadius.circular(sp(8)),
      ),
      child: Row(
        children: <Widget>[
          TextWidget(
            hintText ?? ' Search by keywords',
            fontSize: sp(18),
          ),
          const Spacer(),
          Icon(CupertinoIcons.search, size: sp(25)),
        ],
      ),
    );
  }
}
