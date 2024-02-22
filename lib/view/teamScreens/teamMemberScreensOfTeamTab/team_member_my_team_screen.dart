import 'package:comnow/controller/profileControllers/member_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/data.dart';
import '../../popUpMenuScreens/adminSidePopUpMenuScreens/message_templates_screen.dart';
import '../../popUpMenuScreens/adminSidePopUpMenuScreens/voice_message_screen.dart';
import '../../widgets/widget_utils.dart';

class TeamMemberMyTeamScreen extends StatefulWidget {
  const TeamMemberMyTeamScreen({super.key});

  @override
  State<TeamMemberMyTeamScreen> createState() => _TeamMemberMyTeamScreenState();
}

class _TeamMemberMyTeamScreenState extends State<TeamMemberMyTeamScreen> {
  MemberProfileController memberProfileController =
      Get.find(tag: 'memberProfileController');

  void getMemberData() {
    if (memberProfileController.getMemberData.value == null) {
      memberProfileController.handleGetMemberProfile(
        context,
        token: Constants.tokenOfMember.value,
        language: Constants.codeOfLanguage.value,
      );
    }
  }

  @override
  void initState() {
    getMemberData();
    super.initState();
  }


  DataFile dataFile = DataFile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'My Team',
            fontFamily: Constants.fontsFamilyBold,
            fontSize: 16.sp),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(gradient: Constants.appGradient),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: ReorderableListView(
            onReorder: (oldIndex, newIndex) {
              setState(() {
                final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
                final item = dataFile.teamMemberList.removeAt(oldIndex);
                dataFile.teamMemberList.insert(newIdx, item);
              });
            },
            padding: EdgeInsets.symmetric(vertical: 3.2.h),
            shrinkWrap: true,
            children: [
              for (final item in dataFile.teamMemberList)
                Container(
                  key: Key(item.uniqueId.toString()),
                  margin: EdgeInsets.symmetric(horizontal: 2.4.h),
                  // Show Cards in List
                  child: teamMemberMainMemberCard(
                    item,
                    onTap: () => teamMemberCardBottomSheet(
                      context,
                      pingOnTap: () {
                        Get.back();
                      },
                      textMessageOnTap: () {
                        Get.back();
                        Get.to(() => const MessageTemplatesScreen());
                      },
                      voiceMessageOnTap: () {
                        Get.back();
                        Get.to(() => const VoiceMessageScreen());
                      },
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
