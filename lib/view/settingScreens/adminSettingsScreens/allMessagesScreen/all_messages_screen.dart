import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controller/profileControllers/profile_controller.dart';
import '../../../../utils/color_data.dart';
import '../../../../utils/constant.dart';
import '../../../widgets/widget_utils.dart';
import 'add_new_message_screen.dart';

class AllMessagesScreen extends StatefulWidget {
  const AllMessagesScreen({super.key});

  @override
  State<AllMessagesScreen> createState() => _AllMessagesScreenState();
}

class _AllMessagesScreenState extends State<AllMessagesScreen> {
  ProfileController profileController = Get.find(tag: 'profileController');
  var isSelectedSortItem = 2.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'All Messages',
            fontFamily: Constants.fontsFamilyBold,
            fontSize: 16.sp),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: CustomColors.whiteButtonColor,
              size: 2.h,
            )),
        actions: [
          IconButton(
              onPressed: () {
                sortingDialogBox(context,
                    isSelectedSort: RxInt(isSelectedSortItem.value));
              },
              icon: Row(
                children: [
                  getSvgImage('sort_white.svg',
                      color: CustomColors.whiteButtonColor,
                      width: 3.h,
                      height: 3.h),
                  getHorSpace(0.4.h),
                  customWhiteMediumText(
                      text: 'Sort',
                      fontSize: 14.sp,
                      fontFamily: Constants.fontsFamilyRegular),
                  getHorSpace(1.h),
                ],
              ))
        ],
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(gradient: Constants.appGradient),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 3.0.h,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Obx(
                () => profileController.loadingGetAdminAddNewMessage.value ||
                        profileController.loadingAdminAddNewMessage.value ||
                        profileController.getTemplateOfMessageModel.value ==
                            null
                    ? SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        child: Shimmer.fromColors(
                            baseColor: CustomColors.bottomBackgroundColor,
                            highlightColor: Colors.black12,
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    padding: EdgeInsets.only(
                                        top: 3.2.h, left: 2.h, right: 2.h),
                                    shrinkWrap: true,
                                    itemCount: profileController
                                                .getTemplateOfMessageModel
                                                .value ==
                                            null
                                        ? 5
                                        : profileController
                                                .getTemplateOfMessageModel
                                                .value!
                                                .data!
                                                .predefinedMessages!
                                                .length +
                                            1,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 6.h,
                                        margin: EdgeInsets.only(bottom: 1.4.h),
                                        decoration: BoxDecoration(
                                          color: CustomColors
                                              .textFormFieldBackgroundColor,
                                          borderRadius: BorderRadius.circular(
                                            16.0,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )),
                      )
                    : Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Colors.transparent,
                        ),
                        child: ReorderableListView(
                          padding: EdgeInsets.only(top: 3.2.h),
                          onReorder: (oldIndex, newIndex) {
                            setState(() {
                              final newIdx =
                                  newIndex > oldIndex ? newIndex - 1 : newIndex;
                              final item = profileController
                                  .getTemplateOfMessageModel
                                  .value!
                                  .data!
                                  .predefinedMessages!
                                  .removeAt(oldIndex);
                              profileController.getTemplateOfMessageModel.value!
                                  .data!.predefinedMessages!
                                  .insert(newIdx, item);
                            });
                          },
                          shrinkWrap: true,
                          children: [
                            for (final item in profileController
                                .getTemplateOfMessageModel
                                .value!
                                .data!
                                .predefinedMessages!)
                              Container(
                                  key: Key(item.id.toString()),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 2.4.h),
                                  // Show Cards in List
                                  child: allMessagesCard(
                                    item.text.toString(),
                                  ))
                          ],
                        ),
                      ),
              ),
            ),
            getVerSpace(1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.h),
              child: gradientButton(
                'Add New Message',
                onTap: () => Get.to(() => const AddNewMessagesScreen()),
              ),
            ),
            getVerSpace(3.h),
          ]),
        ),
      ),
    );
  }
}
