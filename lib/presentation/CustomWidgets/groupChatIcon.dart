import 'package:flutter/material.dart';
import 'package:messenger_app_ui/core/theme_data.dart';
import 'package:sizer/sizer.dart';

class GroupChatIconWidget extends StatelessWidget {
  const GroupChatIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 1.w,left: 3.w),
      child: Container(
        width: 6.h,
        decoration:  BoxDecoration(
          color: AppThemes.groupIconBackgroundColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.people_outline,size: 25,),
      ),
    );
  }
}
