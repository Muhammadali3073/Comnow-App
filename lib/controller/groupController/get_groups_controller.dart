import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/groupModels/add_member_model.dart';
import '../../model/groupModels/get_groups_model.dart';
import '../../model/groupModels/get_member_in_group.dart';
import '../../model/groupModels/re_add_member_model.dart';
import '../../services/api_services.dart';
import '../../services/time_out_method.dart';
import '../../utils/color_data.dart';
import '../../view/popUpMenuScreens/adminSidePopUpMenuScreens/addMemberScreens/generate_qr_code_screen.dart';
import '../../view/popUpMenuScreens/adminSidePopUpMenuScreens/addMemberScreens/share_qr_code_screen.dart';
import '../../view/widgets/widget_utils.dart';

class GetGroupsController extends GetxController {
  var loadingCreateGroup = false.obs;
  var loadingGetGroups = false.obs;
  var loadingEditGroup = false.obs;
  var loadingAddMemberInGroup = false.obs;
  var loadingGetMembersInGroup = false.obs;
  var loadingDeleteMemberInGroup = false.obs;
  var loadingEditMemberStatus = false.obs;
  var loadingAddMemberInTeam = false.obs;
  var loadingGetMembersInTeam = false.obs;
  var loadingDeleteGroup = false.obs;
  var loadingEditMemberProfile = false.obs;
  var loadingReAddMember = false.obs;

  Rxn<MembersModel> allMembersData = Rxn<MembersModel>();
  Rxn<GetGroups> getGroupsData = Rxn<GetGroups>();
  Rxn<MembersModel> getMemberInGroupsData = Rxn<MembersModel>();
  Rxn<ReAddMemberDataModel> reAddMemberDataModel = Rxn<ReAddMemberDataModel>();


  var isGroup = false.obs;

  setSubscription(isSubscription) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isSubscription', isSubscription);
  }

  // Create group
  handleCreateGroup(
    BuildContext? context, {
    token,
    groupName,
    language,
  }) async {
    loadingCreateGroup.value = true;
    loadingDialogBox(context!, RxBool(loadingCreateGroup.value));

    GroupApiServices.createGroup(
      token: token,
      groupName: groupName,
      language: language,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingCreateGroup);
      } else if (response.statusCode == 200) {
        loadingCreateGroup.value = false;
        Get.back();

        // Call group Data
        handleGetGroups(context, token: token, language: language);

        // Go to next screen
        Get.back();

        Fluttertoast.showToast(
            msg: '$groupName Create group successfully'.tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: CustomColors.toastColor,
            textColor: CustomColors.titleWhiteTextColor,
            fontSize: 14.sp);
      } else if (response.statusCode == 500) {
        loadingCreateGroup.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else if (response.statusCode == 401) {
        loadingCreateGroup.value = false;
        Get.back();
        if (jsonData['message'] == "Please subscribe") {
          setSubscription(false);
          subscriptionDialogBox(context);
        }
      } else {
        loadingCreateGroup.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }

  // Get Groups
  handleGetGroups(
    BuildContext? context, {
    token,
    language,
  }) async {
    loadingGetGroups.value = true;

    GroupApiServices.getGroups(
      token: token,
      language: language,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingGetGroups);
      } else if (response.statusCode == 200) {
        loadingGetGroups.value = false;

        getGroupsData.value = getGroupsFromJson(response.body);

        log(getGroupsData.value!.message.toString());
      } else if (response.statusCode == 500) {
        loadingGetGroups.value = false;

        customScaffoldMessenger(
            context!, 'Something went wrong. Please try again.'.tr);
      } else if (response.statusCode == 401) {
        loadingGetGroups.value = false;
        Get.back();
        if (jsonData['message'] == "Please subscribe") {
          setSubscription(false);
          subscriptionDialogBox(context!);
        }
      } else {
        loadingGetGroups.value = false;
        if (jsonData['message'] == "Team not exist") {
          getGroupsData.value = null;
        } else if (jsonData['message'] == "Please subscribe") {
          customScaffoldMessenger(context!, jsonData['message']);
        }
      }
    });
  }

  // Edit group
  handleEditGroup(
    BuildContext? context, {
    token,
    groupName,
    groupId,
    language,
  }) async {
    loadingEditGroup.value = true;
    loadingDialogBox(context!, RxBool(loadingEditGroup.value));

    GroupApiServices.editGroupName(
      token: token,
      groupName: groupName,
      groupId: groupId,
      language: language,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingEditGroup);
      } else if (response.statusCode == 200) {
        loadingEditGroup.value = false;
        Get.back();

        // Call group Data
        handleGetGroups(context, token: token, language: language);

        // Go to next screen
        Get.back();
        handleGetMembersInGroups(context, language,
            token: token, groupId: groupId);

        Fluttertoast.showToast(
            msg: "$groupName rename successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: CustomColors.toastColor,
            textColor: CustomColors.titleWhiteTextColor,
            fontSize: 14.sp);
      } else if (response.statusCode == 500) {
        loadingEditGroup.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else if (response.statusCode == 401) {
        loadingEditGroup.value = false;
        Get.back();
        if (jsonData['message'] == "Please subscribe") {
          setSubscription(false);
          subscriptionDialogBox(context);
        }
      } else {
        loadingEditGroup.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }

  // Add Member In Group
  handleAddMemberInGroup(
    BuildContext? context,
    defaultTeam, {
    token,
    firstName,
    lastName,
    initials,
    color,
    groupId,
    language,
  }) async {
    loadingAddMemberInGroup.value = true;
    loadingDialogBox(context!, RxBool(loadingAddMemberInGroup.value));

    GroupApiServices.addMembersInGroup(
      token: token,
      lastName: lastName,
      firstName: firstName,
      initials: initials,
      color: color,
      groupId: groupId,
      language: language,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingAddMemberInGroup);
      } else if (response.statusCode == 200) {
        loadingAddMemberInGroup.value = false;
        Get.back();

        final addMemberModel = addMemberModelFromJson(response.body);

        // Go to next screen
        Get.off(() => GenerateQRCodeScreen(
              enrollmentCode:
                  addMemberModel.data!.user!.enrollmentCode!.code.toString(),
              fullName: addMemberModel.data!.user!.fullName!.toString(),
            ));

        handleGetMembersInGroups(context, language,
            token: token, groupId: groupId);
        handleGetGroups(context, token: token, language: language);
        handleGetMembersInTeam(context, defaultTeam, language,
            token: token, loadingStatus: false);

        customScaffoldMessenger(context, 'User add successfully'.tr);
      } else if (response.statusCode == 500) {
        loadingAddMemberInGroup.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else if (response.statusCode == 401) {
        loadingAddMemberInGroup.value = false;
        Get.back();
        if (jsonData['message'] == "Please subscribe") {
          setSubscription(false);
          subscriptionDialogBox(context);
        }
      } else {
        loadingAddMemberInGroup.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }

  // Get Members In Groups
  handleGetMembersInGroups(
    BuildContext? context,
    language, {
    token,
    groupId,
  }) async {
    loadingGetMembersInGroup.value = true;
    GroupApiServices.getMembersInGroup(
      language,
      token: token,
      groupId: groupId.toString(),
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingGetMembersInGroup);
      } else if (response.statusCode == 200) {
        loadingGetMembersInGroup.value = false;

        getMemberInGroupsData.value = membersModelFromJson(response.body);

        log(getMemberInGroupsData.value!.message.toString());
      } else if (response.statusCode == 500) {
        loadingGetMembersInGroup.value = false;

        customScaffoldMessenger(
            context!, 'Something went wrong. Please try again.'.tr);
      } else if (response.statusCode == 401) {
        loadingGetMembersInGroup.value = false;
        Get.back();
        if (jsonData['message'] == "Please subscribe") {
          setSubscription(false);
          subscriptionDialogBox(context!);
        }
      }
    });
  }

  // Delete member
  handleDeleteMember(
    BuildContext? context,
    defaultTeam, {
    userName,
    token,
    teamMemberId,
    groupId,
    language,
  }) async {
    loadingDeleteMemberInGroup.value = true;
    loadingDialogBox(context!, RxBool(loadingDeleteMemberInGroup.value));

    GroupApiServices.deleteMember(
      token: token,
      teamMemberId: teamMemberId,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingDeleteMemberInGroup);
      } else if (response.statusCode == 200) {
        loadingDeleteMemberInGroup.value = false;
        Get.back();

        // Call group Data
        if (groupId != 'null') {
          handleGetMembersInGroups(context, language,
              token: token, groupId: groupId);
          handleGetGroups(context, token: token, language: language);
          handleGetMembersInTeam(context, defaultTeam, language, token: token);
        } else {
          handleGetMembersInTeam(context, defaultTeam, language, token: token);
          handleGetGroups(context, token: token, language: language);
        }
        Fluttertoast.showToast(
            msg: "$userName is deleted",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: CustomColors.toastColor,
            textColor: CustomColors.titleWhiteTextColor,
            fontSize: 14.sp);
      } else if (response.statusCode == 500) {
        loadingDeleteMemberInGroup.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else if (response.statusCode == 401) {
        loadingDeleteMemberInGroup.value = false;
        Get.back();
        if (jsonData['message'] == "Please subscribe") {
          setSubscription(false);
          subscriptionDialogBox(context);
        }
      } else {
        loadingDeleteMemberInGroup.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }

  // Delete group
  handleDeleteGroup(
    BuildContext? context, {
    groupName,
    token,
    groupId,
    language,
  }) async {
    loadingDeleteGroup.value = true;
    loadingDialogBox(context!, RxBool(loadingDeleteGroup.value));

    GroupApiServices.deleteGroup(
      token: token,
      groupId: groupId,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingDeleteGroup);
      } else if (response.statusCode == 200) {
        loadingDeleteGroup.value = false;
        Get.back();

        Get.back();

        // Call group Data
        handleGetGroups(context, token: token, language: language);

        Fluttertoast.showToast(
            msg: "$groupName is deleted",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: CustomColors.toastColor,
            textColor: CustomColors.titleWhiteTextColor,
            fontSize: 14.sp);
      } else if (response.statusCode == 500) {
        loadingDeleteGroup.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else if (response.statusCode == 401) {
        loadingDeleteGroup.value = false;
        Get.back();
        if (jsonData['message'] == "Please subscribe") {
          setSubscription(false);
          subscriptionDialogBox(context);
        }
      } else {
        loadingDeleteGroup.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }

  // Edit Member status
  handleEditMemberStatus(
    BuildContext? context,
    defaultTeam, {
    token,
    teamMemberId,
    groupId,
    blockedStatus,
    userName,
    language,
  }) async {
    loadingEditMemberStatus.value = true;
    loadingDialogBox(context!, RxBool(loadingEditMemberStatus.value));

    GroupApiServices.editMemberStatus(
      token: token,
      teamMemberId: teamMemberId,
      blockedStatus: blockedStatus,
      language: language,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingEditMemberStatus);
      } else if (response.statusCode == 200) {
        loadingEditMemberStatus.value = false;
        Get.back();

        // Call group Data
        if (groupId != 'null') {
          handleGetMembersInGroups(context, language,
              token: token, groupId: groupId);
          handleGetGroups(context, token: token, language: language);
          handleGetMembersInTeam(context, defaultTeam, language, token: token);
        } else {
          handleGetMembersInTeam(context, defaultTeam, language, token: token);
          handleGetGroups(context, token: token, language: language);
        }

        Fluttertoast.showToast(
            msg: "$userName  is $blockedStatus now",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: CustomColors.toastColor,
            textColor: CustomColors.titleWhiteTextColor,
            fontSize: 14.sp);
      } else if (response.statusCode == 500) {
        loadingEditMemberStatus.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else if (response.statusCode == 401) {
        loadingEditMemberStatus.value = false;
        Get.back();
        if (jsonData['message'] == "Please subscribe") {
          setSubscription(false);
          subscriptionDialogBox(context);
        }
      } else {
        loadingEditMemberStatus.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }

  // Add Member In Team
  handleAddMemberInTeam(
    BuildContext? context,
    defaultTeam, {
    token,
    firstName,
    lastName,
    initials,
    color,
    language,
  }) async {
    loadingAddMemberInTeam.value = true;
    loadingDialogBox(context!, RxBool(loadingAddMemberInTeam.value));

    MembersApiServices.getAddMemberInTeam(
      token: token,
      lastName: lastName,
      firstName: firstName,
      initials: initials,
      color: color,
      language: language,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingAddMemberInTeam);
      } else if (response.statusCode == 200) {
        loadingAddMemberInTeam.value = false;
        Get.back();

        final addMemberModel = addMemberModelFromJson(response.body);
        // Go to next screen
        Get.off(() => GenerateQRCodeScreen(
              enrollmentCode:
                  addMemberModel.data!.user!.enrollmentCode!.code.toString(),
              fullName: addMemberModel.data!.user!.fullName!.toString(),
            ));

        handleGetMembersInTeam(context, defaultTeam, language,
            token: token, loadingStatus: false);

        customScaffoldMessenger(context, 'User add successfully'.tr);
      } else if (response.statusCode == 500) {
        loadingAddMemberInTeam.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else if (response.statusCode == 401) {
        loadingAddMemberInTeam.value = false;
        Get.back();
        if (jsonData['message'] == "Please subscribe") {
          setSubscription(false);
          subscriptionDialogBox(context);
        }
      } else {
        loadingAddMemberInTeam.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }

  // Get Members In Team
  handleGetMembersInTeam(
    BuildContext? context,
    defaultTeam,
    language, {
    token,
    loadingStatus,
  }) async {
    loadingGetMembersInTeam.value = loadingStatus ?? true;

    GroupApiServices.getMembersInTeam(
      defaultTeam,
      language,
      token: token,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingGetMembersInTeam);
      } else if (response.statusCode == 200) {
        loadingGetMembersInTeam.value = false;
        allMembersData.value = membersModelFromJson(response.body);

        log(allMembersData.value!.message.toString());
      } else if (response.statusCode == 500) {
        loadingGetMembersInTeam.value = false;
        customScaffoldMessenger(
            context!, 'Something went wrong. Please try again.'.tr);
      } else if (response.statusCode == 401) {
        loadingGetMembersInTeam.value = false;
        Get.back();
        if (jsonData['message'] == "Please subscribe") {
          setSubscription(false);
          subscriptionDialogBox(context!);
        }
      }
    });
  }

  // Edit Member Profile
  handleEditMemberProfile(
    BuildContext? context,
    defaultTeam, {
    token,
    teamMemberId,
    groupId,
    fullName,
    initials,
    initialsColor,
    userName,
    language,
  }) async {
    loadingEditMemberProfile.value = true;
    loadingDialogBox(context!, RxBool(loadingEditMemberProfile.value));

    GroupApiServices.editMemberProfile(
      token: token,
      teamMemberId: teamMemberId,
      fullName: fullName,
      initials: initials,
      initialsColor: initialsColor,
      language: language,
    ).then((response) async {
      var jsonData = jsonDecode(response.body);

      if (response == null) {
        timeOutException(loading: loadingEditMemberProfile);
      } else if (response.statusCode == 200) {
        loadingEditMemberProfile.value = false;
        Get.back();

        // Call group Data
        if (groupId != 'null') {
          handleGetMembersInGroups(context, language,
              token: token, groupId: groupId);
          handleGetGroups(context, token: token, language: language);
          handleGetMembersInTeam(context, defaultTeam, language, token: token);
        } else {
          handleGetMembersInTeam(context, defaultTeam, language, token: token);
        }

        Fluttertoast.showToast(
            msg: "$userName is updated successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: CustomColors.toastColor,
            textColor: CustomColors.titleWhiteTextColor,
            fontSize: 14.sp);
      } else if (response.statusCode == 500) {
        loadingEditMemberProfile.value = false;
        Get.back();
        customScaffoldMessenger(
            context, 'Something went wrong. Please try again.'.tr);
      } else if (response.statusCode == 401) {
        loadingEditMemberProfile.value = false;
        Get.back();
        if (jsonData['message'] == "Please subscribe") {
          setSubscription(false);
          subscriptionDialogBox(context);
        }
      } else {
        loadingEditMemberProfile.value = false;
        Get.back();
        customScaffoldMessenger(context, jsonData['message']);
      }
    });
  }

}
