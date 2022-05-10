import 'package:flutter/material.dart';

import '../constants/font_size.dart';
import '../utils/sizer_utils.dart';

class CustomScaffoldWidget extends StatelessWidget {
  const CustomScaffoldWidget({
    Key? key,
    this.body,
    this.appBar,
    this.usePadding = true,
    this.useSingleScroll = true,
    this.bg,
    this.scaffoldKey,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
  }) : super(key: key);

  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? body;
  final AppBar? appBar;
  final bool usePadding;
  final bool useSingleScroll;
  final Color? bg;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawerEnableOpenDragGesture: true,
        key: scaffoldKey,
        appBar: appBar,
        backgroundColor: bg,
        body: SizedBox(
          height: sh(100),
          width: double.infinity,
          child: useSingleScroll
              ? SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: usePadding ? sp(kcGlobalPadding) : 0,
                    ),
                    child: body,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: usePadding ? sp(15.0) : 0,
                  ),
                  child: body,
                ),
        ),
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
