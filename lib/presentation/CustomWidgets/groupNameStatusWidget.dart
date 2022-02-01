
import 'package:flutter/material.dart';
import 'package:messenger_app_ui/core/api_data_simulator.dart';
import 'package:messenger_app_ui/core/constants.dart';
import 'package:sizer/sizer.dart';


class GroupNameStatusWidget extends StatelessWidget {
  const GroupNameStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 1.h),
      child: SizedBox(
        width: SizerUtil.orientation == Orientation.portrait ?  30.w : 30.h,
        child: Column(
          crossAxisAlignment: AppStringsData.currentScreenAlign == ScreenAlign.rTL ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children:   [
            Text(ApiSimulator.groupChatTitle,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 14),),
            Row(
              mainAxisAlignment:AppStringsData.currentScreenAlign == ScreenAlign.rTL ? MainAxisAlignment.end : MainAxisAlignment.start,
             children: [
               Text(AppStringsData.onlineMembers,style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 14),),
               Text(ApiSimulator.onlineMembers.toString(),style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 12),),
               Text(' , ',style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 14),),
               Text(AppStringsData.member,style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 14),),
               Text(ApiSimulator.allMembers.toString(),style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 14),),




             ],
            )
          ],
        ),
      ),
    );
  }
}
