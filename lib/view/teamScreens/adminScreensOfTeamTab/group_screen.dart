import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/groupController/get_groups_controller.dart';
import '../../../utils/color_data.dart';
import '../../../utils/data.dart';
import '../../widgets/widget_utils.dart';
import 'separate_group_screen.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  GetGroupsController getGroupsController =
      Get.find(tag: 'getGroupsController');

  DataFile dataFile = DataFile();

  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
      final item = getGroupsController.getGroupsData.value!.data!.teams!
          .removeAt(oldIndex);
      getGroupsController.getGroupsData.value!.data!.teams!
          .insert(newIdx, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: Obx(
        () => getGroupsController.getGroupsData.value == null
            ? const SizedBox.shrink()
            : getGroupsController.loadingGetGroups.value
                ? SizedBox(
                    child: Shimmer.fromColors(
                        baseColor: CustomColors.bottomBackgroundColor,
                        highlightColor: Colors.black12,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              getGroupsController.getGroupsData.value == null
                                  ? 1
                                  : getGroupsController
                                      .getGroupsData.value!.data!.teams!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 6.h,
                              margin: EdgeInsets.only(
                                  right: 2.4.h, left: 2.4.h, top: 2.h),
                              decoration: BoxDecoration(
                                color:
                                    CustomColors.textFormFieldBackgroundColor,
                                borderRadius: BorderRadius.circular(
                                  16.0,
                                ),
                              ),
                            );
                          },
                        )),
                  )
                : ReorderableListView(
                    onReorder: onReorder,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 2.4.h),
                    children: [
                      for (final item in getGroupsController
                          .getGroupsData.value!.data!.teams!)
                        Container(
                            key: Key(item.id.toString()),
                            margin: EdgeInsets.only(left: 2.4.h, right: 2.4.h),

                            // Show Cards in List
                            child: groupCard(
                              item.name,
                              item.users!,
                              onTap: () {
                                Get.to(() => SeparateGroupScreen(
                                      titleOfGroup: item.name,
                                      idOfGroup: item.id,
                                    ));
                              },
                            ))
                    ],
                  ),
      ),
    );
  }
}
