import 'package:flutter/material.dart';
import 'package:messenger_app_ui/core/constants.dart';
import 'package:messenger_app_ui/core/theme_data.dart';
import 'package:messenger_app_ui/presentation/CustomWidgets/groupChatIcon.dart';
import 'package:messenger_app_ui/presentation/CustomWidgets/groupNameStatusWidget.dart';
import 'package:sizer/sizer.dart';

class GroupChat extends StatefulWidget {
  const GroupChat({Key? key}) : super(key: key);

  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        backgroundColor: AppThemes.scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight:8.h,
          automaticallyImplyLeading: false,
          elevation: 2,
          leading:   _buildPopUpMenu(),
          actions:  [
            const GroupNameStatusWidget(),
            const GroupChatIconWidget(),
            IconButton(icon:  Icon(Icons.arrow_forward_ios,color: Theme.of(context).iconTheme.color,), onPressed: () => Navigator.pop(context) ,),

          ],
        ),
        body: SafeArea(

            child: Container()),
      ),
    );
  }

  Widget  _buildPopUpMenu() {
     return PopupMenuButton(
       shape:  const RoundedRectangleBorder(
     borderRadius: BorderRadius.all(
     Radius.circular(10.0),
    ),
    ),
       itemBuilder: (BuildContext context) {
       return [
          PopupMenuItem(
           child: SizedBox(
            width: SizerUtil.orientation == Orientation.portrait ?  50.w : 50.h,

             child: Row(

               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text(
                   AppStringsData.groupChatPopUpMenuItemsSearch,
                   style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 14),
                 ),
                 IconButton(icon:  Icon(Icons.search,color: AppThemes.iconsColor,), onPressed: () {  },),
               ],
             ),
           ),),


         PopupMenuItem(
           child: SizedBox(
             width: SizerUtil.orientation == Orientation.portrait ?  50.w : 50.h,

             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text(
                   AppStringsData.groupChatPopUpMenuItemsMute,
                   style: TextStyle(color: Theme.of(context).primaryColor,fontSize:14),
                 ),
                 IconButton(icon:  Icon(Icons.volume_off,color: AppThemes.iconsColor,), onPressed: () {  },),
               ],
             ),
           ),),

         PopupMenuItem(
           child: SizedBox(
             width: SizerUtil.orientation == Orientation.portrait ?  50.w : 50.h,

             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text(
                   AppStringsData.groupChatPopUpMenuItemsExit,
                   style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 14),
                 ),
                 IconButton(icon:  Icon(Icons.exit_to_app_sharp,color: AppThemes.iconsColor,), onPressed: () {  },),
               ],
             ),
           ),)
       ] ;  },) ;

  }
}
