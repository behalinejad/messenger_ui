import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app_ui/core/api_data_simulator.dart';
import 'package:messenger_app_ui/core/theme_data.dart';
import 'package:messenger_app_ui/models/chat_message.dart';
import 'package:sizer/sizer.dart';

class GroupChatBody extends StatelessWidget {
  const GroupChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 5.sp,right: 5.sp  ),
      child: Column(
        children: [

          Expanded(child: ListView.builder(
              itemCount: ApiSimulator.mockChatMessages.length,
              itemBuilder: (context,index) {
            return Padding(
              padding:  const EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 5),
              child: _buildMessage(ApiSimulator.mockChatMessages[index]),
            );
          })),
        ],
      ),
    );
  }

  Widget _buildMessage(ChatMessage chatMessage) {

    return Row(
        mainAxisAlignment: chatMessage.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          chatMessage.chatMessageType == MessageType.text ?
            buildTextMessage(chatMessage) :
            buildDocumentMessage(chatMessage),

        ],
    );

  }

  Widget buildTextMessage(ChatMessage chatMessage ) {
    if (chatMessage.isSender) {
      return Container(        /// while The sender is from current device
        decoration:  BoxDecoration(
          color:  AppThemes.chatMessageColor,
          borderRadius:const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),

        child: SizedBox(
            width: 60.w,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                        /*borderRadius:const BorderRadius.all(
                          Radius.circular(10.0),
                        ),*/
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
                ],
              ),
            )),
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
          Container(
            decoration:  BoxDecoration(
              color:  AppThemes.chatMessageNotOwnerColor,
              borderRadius:const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),

            child: SizedBox(
                width: 60.w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                    ],
                  ),
                )),
          ),
        ],
      );
    }
  }

  Widget buildDocumentMessage(ChatMessage chatMessage) {

    return Container() ;
  }

  String _getMessageTextFromId(String repliedToId) {
    return ApiSimulator.mockChatMessages.firstWhere((element) => element.id == repliedToId).text;
  }
  String _getMessageOwnerFromId(String repliedToId) {
    return ApiSimulator.mockChatMessages.firstWhere((element) => element.id == repliedToId).owner;
  }


}