import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/components/image_widget.dart';
import '../../../../cores/utils/sizer_utils.dart';

class FeedListViewWidget extends StatelessWidget {
  const FeedListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const Divider(),
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: sp(30)),
      itemCount: 10,
      itemBuilder: (_, int index) {
        return const _FeedItemWidget();
      },
    );
  }
}

class _FeedItemWidget extends StatelessWidget {
  const _FeedItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sp(10)),
          child: SizedBox(
            height: sp(40),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(sp(100)),
                  child: SizedBox(
                    height: sp(40),
                    width: sp(40),
                    child: const CustomImageWidget(
                      imageUrl:
                          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                      imageTypes: ImageTypes.network,
                    ),
                  ),
                ),
                horizontalSpace(5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget('robertfox', fontSize: sp(14)),
                    TextWidget(
                      '3 hours ago',
                      fontSize: sp(14),
                      textColor: const Color(0xff8E8F99),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_vert_sharp, color: Color(0xff000000))
              ],
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sp(10)),
          child: TextWidget(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Feugiat tristique in morbi nunc enim vitae. Gravida facilisis sit lobortis eget. Lorem faucibus vulputate purus viverra eu elit nec nisl. Enim ultrices neque eget pharetra auctor euismod auctor elit. See more',
            fontSize: sp(14),
          ),
        ),
        verticalSpace(20),
        SizedBox(
          height: sp(428),
          width: double.infinity,
          child: const CustomImageWidget(
            imageUrl: 'assets/images/food.png',
            imageTypes: ImageTypes.asset,
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sp(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buttons(CupertinoIcons.heart, '2.5k'),
              horizontalSpace(24),
              buttons(CupertinoIcons.chat_bubble, '250'),
              horizontalSpace(24),
              buttons(Icons.share_outlined, '25'),
              const Spacer(),
              buttons(CupertinoIcons.bookmark, '')
            ],
          ),
        ),
        verticalSpace(20),
      ],
    );
  }

  Widget buttons(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, size: sp(25), color: Colors.black),
        horizontalSpace(5),
        TextWidget(
          text,
          fontSize: sp(16),
          textColor: const Color(0xff4A4C5A),
        )
      ],
    );
  }
}
