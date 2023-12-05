import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/constant.dart';
import '../../utils/data.dart';
import '../widgets/widget_utils.dart';

//ignore: must_be_immutable
class SeparateGroupScreen extends StatefulWidget {
  SeparateGroupScreen({super.key, this.titleOfGroup, this.groupMemberList});

  String? titleOfGroup;
  List<MemberModel>? groupMemberList;

  @override
  State<SeparateGroupScreen> createState() => _SeparateGroupScreenState();
}

class _SeparateGroupScreenState extends State<SeparateGroupScreen>
    with SingleTickerProviderStateMixin {
  DataFile dataFile = DataFile();
  var isSelectedSortItem = 2.obs;
  var appBarHeight = AppBar().preferredSize.height - 0.4.h;

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

  // Popup Menu Item Routes
  onMenuItemSelected(int value) {
    if (value == OptionsForGroups.addMember.index) {
    } else if (value == OptionsForGroups.pingToAll.index) {
    } else if (value == OptionsForGroups.sendMessageToAll.index) {
    } else if (value == OptionsForGroups.sendVoiceTolAll.index) {
    } else if (value == OptionsForGroups.deleteGroup.index) {
    } else if (value == OptionsForGroups.sort.index) {
      sortingDialogBox(context, dataFile,
          isSelectedSort: RxInt(isSelectedSortItem.value));
    } else if (value == OptionsForGroups.rename.index) {}
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: widget.titleOfGroup.toString(),
            fontFamily: Constant.fontsFamilyBold,
            fontSize: 16.sp),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: whiteButtonColor,
              size: 2.h,
            )),
        actions: [
          PopupMenuButton(
            iconColor: whiteButtonColor,
            color: popupMenuColor,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            constraints: BoxConstraints.tight(Size(24.h, 34.5.h)),
            onSelected: (value) {
              onMenuItemSelected(value as int);
            },
            offset: Offset(0.0, appBarHeight),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0.px),
                bottomRight: Radius.circular(16.0.px),
              ),
            ),
            itemBuilder: (ctx) => [
              groupPopupMenuItem(
                'Add member',
                'add_person.svg',
                OptionsForGroups.addMember.index,
                0,
              ),
              groupPopupMenuItem(
                'Ping to all',
                'phone_ring.svg',
                OptionsForGroups.pingToAll.index,
                1,
              ),
              groupPopupMenuItem(
                'Sent a message to all',
                'message.svg',
                OptionsForGroups.sendMessageToAll.index,
                2,
              ),
              groupPopupMenuItem(
                'Sent voice message to all',
                'mic.svg',
                OptionsForGroups.sendVoiceTolAll.index,
                3,
              ),
              groupPopupMenuItem(
                'Delete group',
                'delete_icon.svg',
                OptionsForGroups.deleteGroup.index,
                4,
              ),
              groupPopupMenuItem(
                'Sort',
                'sort.svg',
                OptionsForGroups.sort.index,
                5,
              ),
              groupPopupMenuItem(
                'Rename',
                'rename_icon.svg',
                OptionsForGroups.rename.index,
                6,
              ),
            ],
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          topBackgroundColor,
          bottomBackgroundColor,
          topBackgroundColor,
        ])),
        child: Column(
          children: [
            Container(
              color: tabBarColor,
              padding: EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 1.5.h),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customWhiteMediumText(
                      text: widget.titleOfGroup.toString(),
                      fontSize: 15.sp,
                      fontFamily: Constant.fontsFamilyRegular,
                    ),
                    customWhiteMediumText(
                      text: 'Total Member(${widget.groupMemberList!.length})',
                      fontSize: 15.sp,
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
                          'All (${widget.groupMemberList!.where((element) => element.isBlocked == false).length})',
                    ),
                    Tab(
                      text:
                          'Blocked (${widget.groupMemberList!.where((element) => element.isBlocked == true).length})',
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
                        for (final item in widget.groupMemberList!
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
                        for (final item in widget.groupMemberList!
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
        ),
      ),
    );
  }
}
