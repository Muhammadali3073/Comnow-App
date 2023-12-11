import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/data.dart';
import '../../widgets/widget_utils.dart';
import 'separate_group_screen.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  DataFile dataFile = DataFile();

  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      final newIdx = newIndex > oldIndex ? newIndex - 1 : newIndex;
      final item = dataFile.memberList.removeAt(oldIndex);
      dataFile.memberList.insert(newIdx, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: ReorderableListView(
        onReorder: onReorder,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 2.4.h),
        children: [
          for (final item in dataFile.groupList)
            Container(
                key: Key(item.groupUniqueId.toString()),
                margin: EdgeInsets.only(left: 2.4.h, right: 2.4.h),

                // Show Cards in List
                child: groupCard(
                  item.groupName,
                  item.numberOfGroupMembers,
                  onTap: () => Get.to(() => SeparateGroupScreen(
                        titleOfGroup: item.groupName,
                        groupMemberList: item.membersOfGroup,
                      )),
                ))
        ],
      ),
    );
  }
}
