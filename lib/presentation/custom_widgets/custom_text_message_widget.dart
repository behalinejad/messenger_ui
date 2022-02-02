import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:messenger_app_ui/core/api_data_simulator.dart';
import 'package:messenger_app_ui/core/theme_data.dart';
import 'package:messenger_app_ui/logic/text_message_clipper.dart';
import 'package:messenger_app_ui/models/chat_message.dart';
import 'package:sizer/sizer.dart';

class CustomTextMessageWidget extends StatelessWidget {
  final ChatMessage chatMessage;
  const CustomTextMessageWidget({Key? key, required this.chatMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (chatMessage.isSender) {
      return ClipPath(
        clipper: TextMessageClipper(isSender: true),
        child: Container(        /// while The sender is from current device
          decoration:  BoxDecoration(
            color:  AppThemes.chatMessageColor,
            borderRadius:const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),

          child: SizedBox(
              width: 60.w,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5,top: 5,left: 10,right: 20),
                child: Column(
                  children: [
                    chatMessage.repliedToId.isNotEmpty ?
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration:  BoxDecoration(
                          border: Border(
                            right: BorderSide(width: 3.0, color: Colors.lightBlue.shade600),

                          ),
                          color:  AppThemes.chatMessageReplyColor,

                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(_getMessageOwnerFromId(chatMessage.repliedToId),textDirection: TextDirection.rtl,
                                style: TextStyle(color: AppThemes.iconsColor ,fontSize: 12),),
                              Text(_getMessageTextFromId(chatMessage.repliedToId),textDirection: TextDirection.rtl,
                                style: const TextStyle(fontSize: 12),),
                            ],
                          ),
                        ) ,
                      ),
                    ) : Container(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5,bottom: 5),
                      child: Text(chatMessage.text,textDirection: TextDirection.rtl,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(DateTime.parse(chatMessage.dataTime).hour.toString() + ':' + DateTime.parse(chatMessage.dataTime).minute.toString(),
                            style: const TextStyle(fontSize: 10),),
                        ),
                         /// for Check Marks in delivery status
                        chatMessage.chatMessageStatus == MessageStatus.sent ? const Icon(LineIcons.check,color: Colors.black54,)  :
                        chatMessage.chatMessageStatus == MessageStatus.delivered ?  const Icon(LineIcons.doubleCheck,color: Colors.black54,) :
                        const Icon(LineIcons.doubleCheck),
                      ],
                    )
                  ],
                ),
              )),
        ),
      );
    }else{
      return Row(/// while The sender is not current device
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: chatMessage.ownerPhoto.isNotEmpty ? AssetImage(chatMessage.ownerPhoto) : null,
              backgroundColor: Colors.transparent,
            ),
          ),
          ClipPath(
            clipper: TextMessageClipper(isSender: false),
            child: Container(
              decoration:  BoxDecoration(
                color:  AppThemes.chatMessageNotOwnerColor,
                borderRadius:const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),

              child: SizedBox(
                  width: 60.w,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5,top: 5,left: 20,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(chatMessage.owner,
                            style: const TextStyle(fontWeight: FontWeight.w800),),
                        ),
                        chatMessage.repliedToId.isNotEmpty ?
                        ClipRRect(                       /// Container that shows the the replied message
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration:  BoxDecoration(
                              border: Border(
                                right: BorderSide(width: 3.0, color: Colors.lightBlue.shade600),
                              ),
                              color:  AppThemes.chatMessageReplyColor,

                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(_getMessageOwnerFromId(chatMessage.repliedToId),textDirection: TextDirection.rtl,
                                    style: TextStyle(color: AppThemes.iconsColor ,fontSize: 12),),
                                  Text(_getMessageTextFromId(chatMessage.repliedToId),textDirection: TextDirection.rtl,
                                    style: const TextStyle(fontSize: 12),),
                                ],
                              ),
                            ) ,
                          ),
                        ) : Container(),

                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(chatMessage.text,textDirection: TextDirection.rtl,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(DateTime.parse(chatMessage.dataTime).hour.toString() + ':' + DateTime.parse(chatMessage.dataTime).minute.toString(),
                                style: const TextStyle(fontSize: 10),),
                            ),
                            /// for Check Marks in delivery status
                            chatMessage.chatMessageStatus == MessageStatus.sent ? const Icon(LineIcons.check,color: Colors.black54,)  :
                            chatMessage.chatMessageStatus == MessageStatus.delivered ?  const Icon(LineIcons.doubleCheck,color: Colors.black54,) :
                            const Icon(LineIcons.doubleCheck),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      );
    }
  }

  String _getMessageTextFromId(String repliedToId) {
    return ApiSimulator.mockChatMessages.firstWhere((element) => element.id == repliedToId).text;
  }
  String _getMessageOwnerFromId(String repliedToId) {
    return ApiSimulator.mockChatMessages.firstWhere((element) => element.id == repliedToId).owner;
  }
}
