import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/constant.dart';
import '../../utils/data.dart';
import '../widgets/widget_utils.dart';

class AllTeamMemberScreen extends StatefulWidget {
  const AllTeamMemberScreen({super.key});

  @override
  State<AllTeamMemberScreen> createState() => _AllTeamMemberScreenState();
}

class _AllTeamMemberScreenState extends State<AllTeamMemberScreen>
    with SingleTickerProviderStateMixin {
  DataFile dataFile = DataFile();

  TabController? tabController;

  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
      final item = dataFile.memberList.removeAt(oldIndex);
      dataFile.memberList.insert(newIdx, item);
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Container(
          color: tabBarColor,
          padding: EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 0.9.h),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customWhiteMediumText(
                  text: 'My Team',
                  fontSize: 14.sp,
                  fontFamily: Constant.fontsFamilyRegular,
                ),
                customWhiteMediumText(
                  text: 'Total Member(${dataFile.memberList.length})',
                  fontSize: 14.sp,
                  fontFamily: Constant.fontsFamilyRegular,
                ),
              ]),
        ),
        Container(
          height: 3.8.h,
          margin: EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 2.4.h),
          decoration: BoxDecoration(
            color: textFormFieldBackgroundColor,
            borderRadius: BorderRadius.circular(
              25.0,
            ),
          ),
          child: Theme(
            data: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(
                surfaceVariant: Colors.transparent,
              ),
            ),
            child: TabBar(
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: activeTabBarColor,
              ),
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontFamily: Constant.fontsFamilyRegular,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.sp,
                fontFamily: Constant.fontsFamilyRegular,
              ),
              labelColor: titleBlackTextColor,
              unselectedLabelColor: titleWhiteTextColor,
              tabs: [
                Tab(
                  text:
                      'All (${dataFile.memberList.where((element) => element.isBlocked == false).length})',
                ),
                Tab(
                  text:
                      'Blocked (${dataFile.memberList.where((element) => element.isBlocked == true).length})',
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              // first inner tab bar view widget
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.transparent,
                ),
                child: ReorderableListView(
                  onReorder: onReorder,
                  shrinkWrap: true,
                  children: [
                    for (final item in dataFile.memberList
                        .where((element) => element.isBlocked == false))
                      Container(
                          key: Key(item.uniqueId.toString()),
                          margin: EdgeInsets.symmetric(horizontal: 2.4.h),
                          // Show Cards in List
                          child: mainMemberCard(item))
                  ],
                ),
              ),

              // second inner tab bar view widget
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.transparent,
                ),
                child: ReorderableListView(
                  onReorder: onReorder,
                  shrinkWrap: true,
                  children: [
                    for (final item in dataFile.memberList
                        .where((element) => element.isBlocked == true))
                      Container(
                          key: Key(item.uniqueId.toString()),
                          margin: EdgeInsets.symmetric(horizontal: 2.4.h),
                          // Show Cards in List
                          child: mainMemberCard(item))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
