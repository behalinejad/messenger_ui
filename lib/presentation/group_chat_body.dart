
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:messenger_app_ui/core/api_data_simulator.dart';
import 'package:messenger_app_ui/core/theme_data.dart';
import 'package:messenger_app_ui/models/chat_message.dart';
import 'package:messenger_app_ui/presentation/custom_widgets/custom_text_message_widget.dart';
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
          })
          ),
          const SizedBox(height: 40,)
        ],
      ),
    );
  }

  Widget _buildMessage(ChatMessage chatMessage) {

    return Row(
        mainAxisAlignment: chatMessage.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          chatMessage.chatMessageType == MessageType.text ?
          CustomTextMessageWidget(chatMessage: chatMessage,) :
            buildDocumentMessage(chatMessage),

        ],
    );

  }



  Widget buildDocumentMessage(ChatMessage chatMessage) {

    return Container() ;
  }




}
