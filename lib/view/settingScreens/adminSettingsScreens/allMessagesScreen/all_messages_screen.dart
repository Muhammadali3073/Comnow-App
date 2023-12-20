import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../../../utils/color_data.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/data.dart';
import '../../../widgets/widget_utils.dart';
import 'add_new_message_screen.dart';

class AllMessagesScreen extends StatefulWidget {
  const AllMessagesScreen({super.key});

  @override
  State<AllMessagesScreen> createState() => _AllMessagesScreenState();
}

class _AllMessagesScreenState extends State<AllMessagesScreen> {
  DataFile dataFile = DataFile();
  var isSelectedSortItem = 2.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.titleBlackTextColor,
        centerTitle: true,
        title: customWhiteMediumText(
            text: 'All Messages',
            fontFamily: Constant.fontsFamilyBold,
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
                sortingDialogBox(context, dataFile,
                    isSelectedSort: RxInt(isSelectedSortItem.value));
              },
              icon: Row(
                children: [
                  getSvgImage('sort_white.svg',
                      color: CustomColors.whiteButtonColor, width: 3.h, height: 3.h),
                  getHorSpace(0.4.h),
                  customWhiteMediumText(
                      text: 'Sort',
                      fontSize: 14.sp,
                      fontFamily: Constant.fontsFamilyRegular),
                  getHorSpace(1.h),
                ],
              ))
        ],
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          CustomColors.topBackgroundColor,
          CustomColors.bottomBackgroundColor,
          CustomColors.bottomBackgroundColor,
          CustomColors.topBackgroundColor,
        ])),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 3.0.h,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.transparent,
                ),
                child: ReorderableListView(
                  padding: EdgeInsets.only(top: 3.2.h),
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      final newIdx =
                          newIndex > oldIndex ? newIndex - 1 : newIndex;
                      final item =
                          dataFile.messageTemplatesModel.removeAt(oldIndex);
                      dataFile.messageTemplatesModel.insert(newIdx, item);
                    });
                  },
                  shrinkWrap: true,
                  children: [
                    for (final item in dataFile.messageTemplatesModel)
                      Container(
                          key: Key(item.uniqueId.toString()),
                          margin: EdgeInsets.symmetric(horizontal: 2.4.h),
                          // Show Cards in List
                          child: allMessagesCard(
                            item.message.toString(),
                          ))
                  ],
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
