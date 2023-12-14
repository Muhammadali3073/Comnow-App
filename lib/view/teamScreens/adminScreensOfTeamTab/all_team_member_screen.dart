import 'package:comnow/view/popUpMenuScreens/adminSidePopUpMenuScreens/message_templates_screen.dart';
import 'package:comnow/view/popUpMenuScreens/adminSidePopUpMenuScreens/voice_message_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/data.dart';
import '../../../validations/validations.dart';
import '../../popUpMenuScreens/adminSidePopUpMenuScreens/addMemberScreens/share_qr_code_screen.dart';
import '../../widgets/widget_utils.dart';

//ignore: must_be_immutable
class AllTeamMemberScreen extends StatefulWidget {
  AllTeamMemberScreen({super.key, this.isPingToAll});

  RxBool? isPingToAll;

  @override
  State<AllTeamMemberScreen> createState() => _AllTeamMemberScreenState();
}

class _AllTeamMemberScreenState extends State<AllTeamMemberScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController initialsTextController = TextEditingController();

  DataFile dataFile = DataFile();

  TabController? tabController;

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
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      final newIdx =
                          newIndex > oldIndex ? newIndex - 1 : newIndex;
                      final item = dataFile.memberList.removeAt(oldIndex);
                      dataFile.memberList.insert(newIdx, item);
                    });
                  },
                  shrinkWrap: true,
                  children: [
                    for (final item in dataFile.memberList
                        .where((element) => element.isBlocked == false))
                      Container(
                        key: Key(item.uniqueId.toString()),
                        margin: EdgeInsets.symmetric(horizontal: 2.4.h),
                        // Show Cards in List
                        child: mainMemberCard(
                          item,
                          isPingToAll: widget.isPingToAll!.value,
                          onTap: () => item.type == 'Left team'
                              ? leftMemberDialogBox(
                                  context,
                                  item.firstName,
                                  onRemoveTap: () {
                                    Get.back();
                                    Fluttertoast.showToast(
                                        msg:
                                            "${item.firstName} is removed successfully",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: toastColor,
                                        textColor: titleWhiteTextColor,
                                        fontSize: 14.sp);
                                  },
                                  onScanTap: () {
                                    Get.back();
                                    Get.to(() => ShareQRCodeScreen(
                                          memberName: item.firstName,
                                        ));
                                  },
                                )
                              : memberCardBottomSheet(
                                  context,
                                  pingOnTap: () {
                                    Get.back();
                                  },
                                  textMessageOnTap: () {
                                    Get.back();
                                    Get.to(
                                        () => const MessageTemplatesScreen());
                                  },
                                  voiceMessageOnTap: () {
                                    Get.back();
                                    Get.to(() => const VoiceMessageScreen());
                                  },
                                  blockOnTap: () {
                                    Get.back();
                                    blockDialogBox(
                                      context,
                                      userName: item.firstName,
                                      onCreate: () {
                                        Get.back();
                                        Fluttertoast.showToast(
                                            msg:
                                                "${item.firstName} is blocked now",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: toastColor,
                                            textColor: titleWhiteTextColor,
                                            fontSize: 14.sp);
                                      },
                                    );
                                  },
                                  deleteOnTap: () {
                                    Get.back();
                                    deleteGroupDialogBox(
                                      context,
                                      groupName: item.firstName,
                                      onCreate: () {
                                        Get.back();
                                        Fluttertoast.showToast(
                                            msg: "${item.firstName} is deleted",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: toastColor,
                                            textColor: titleWhiteTextColor,
                                            fontSize: 14.sp);
                                      },
                                    );
                                  },
                                  editOnTap: () {
                                    Get.back();
                                    editUserDialogBox(
                                      context,
                                      dataFile,
                                      initialColor: Rx(item.initialBGColor!),
                                      initialsString:
                                          RxString(item.initialName!),
                                      firstNameTextController:
                                          firstNameTextController,
                                      lastNameTextController:
                                          lastNameTextController,
                                      initialsTextController:
                                          initialsTextController,
                                      onCreate: () {
                                        if (Validations
                                            .handleAddMemberScreenError(
                                          firstNameTextController:
                                              firstNameTextController,
                                          lastNameTextController:
                                              lastNameTextController,
                                          initialsTextController:
                                              initialsTextController,
                                          selectedColor: item.initialBGColor!,
                                        ).isNotEmpty) {
                                          Fluttertoast.showToast(
                                              msg: Validations
                                                  .handleAddMemberScreenError(
                                                firstNameTextController:
                                                    firstNameTextController,
                                                lastNameTextController:
                                                    lastNameTextController,
                                                initialsTextController:
                                                    initialsTextController,
                                                selectedColor:
                                                    item.initialBGColor!,
                                              ),
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: toastColor,
                                              textColor: titleWhiteTextColor,
                                              fontSize: 14.sp);
                                        } else {
                                          Get.back();
                                          Fluttertoast.showToast(
                                              msg:
                                                  "${item.firstName} is edited successfully",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: toastColor,
                                              textColor: titleWhiteTextColor,
                                              fontSize: 14.sp);
                                          firstNameTextController.clear();
                                          lastNameTextController.clear();
                                          initialsTextController.clear();
                                        }
                                      },
                                    );
                                  },
                                ),
                        ),
                      )
                  ],
                ),
              ),

              // second inner tab bar view widget
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.transparent,
                ),
                child: ReorderableListView(
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      final newIdx =
                          newIndex > oldIndex ? newIndex - 1 : newIndex;
                      final item = dataFile.memberList.removeAt(oldIndex);
                      dataFile.memberList.insert(newIdx, item);
                    });
                  },
                  shrinkWrap: true,
                  children: [
                    for (final item in dataFile.memberList
                        .where((element) => element.isBlocked == true))
                      Container(
                          key: Key(item.uniqueId.toString()),
                          margin: EdgeInsets.symmetric(horizontal: 2.4.h),
                          // Show Cards in List
                          child: mainMemberCard(
                            item,
                            onTap: () {
                              unblockedDialogBox(
                                context,
                                item.firstName,
                                onUnblock: () {
                                  Get.back();
                                  Fluttertoast.showToast(
                                      msg:
                                          "${item.firstName} unblocked successfully",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: toastColor,
                                      textColor: titleWhiteTextColor,
                                      fontSize: 14.sp);
                                },
                              );
                            },
                          ))
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
