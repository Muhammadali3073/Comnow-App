import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/constant.dart';
import '../widgets/widget_utils.dart';

class MyTeamScreen extends StatelessWidget {
  const MyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: titleBlackTextColor,
          centerTitle: true,
          title: customWhiteMediumText(
              text: 'My Team',
              fontFamily: Constant.fontsFamilyBold,
              fontSize: 16.sp),
          actions: [
            IconButton(
                highlightColor: blueButtonColor.withOpacity(0.1),
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_outlined,
                  size: 3.h,
                  color: whiteButtonColor,
                ))
          ],
          bottom: TabBar(
            indicatorColor: blueButtonColor,
            dividerColor: tabBarColor,
            indicatorPadding: EdgeInsets.zero,
            labelColor: blueTextColor,
            unselectedLabelColor: tabBarTextColor,
            indicatorSize: TabBarIndicatorSize.tab,
            overlayColor:
                MaterialStatePropertyAll(blueButtonColor.withOpacity(0.1)),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: blueTextColor, width: 1.5)),
            labelStyle: TextStyle(
                fontSize: 14.sp, fontFamily: Constant.fontsFamilyMedium),
            unselectedLabelStyle: TextStyle(
                fontSize: 14.sp, fontFamily: Constant.fontsFamilyMedium),
            tabs: const <Widget>[
              Tab(
                text: 'All Team Members',
              ),
              Tab(
                text: 'Groups ',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
            ),
          ],
        ),
      ),
    );
  }
}
