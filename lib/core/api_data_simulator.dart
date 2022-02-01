import 'package:messenger_app_ui/models/chat_message.dart';


class ApiSimulator {

  /// The Class is used to simulate the data from Api


  /// Group chat Screen
  static  const groupChatTitle  = 'گروه همکاری';
  static  const allMembers  = 34 ;
  static  const onlineMembers  = 11;


 /// Mock data for Chat Messaging

 static List<ChatMessage> mockChatMessages = [
   ChatMessage(
       id: 'm123',
       repliedToId: '',
       text: 'این دو نفر که مشاهده می کنید ، فضانورد نیستن ، تو بخش کووید هم کار نمیکنن ، برای امتحان حضوری اومدن  🤣 ',
       chatMessageType: MessageType.text,
       chatMessageStatus: MessageStatus.viewed,
       isSender: false,
       owner: 'سید مجید حسین پور',
       ownerPhoto: '',
       dataTime: DateTime.now().toString() ),

   ChatMessage(
       id: 'm124',
       repliedToId: 'm123',
       text: 'این دو نفر که مشاهده می کنید ، فضانورد نیستن   🤣 ',
       chatMessageType: MessageType.text,
       chatMessageStatus: MessageStatus.viewed,
       isSender: true,
       owner: '',
       ownerPhoto: '',
       dataTime: DateTime.now().toString() ),

   ChatMessage(
       id: 'm125',
       repliedToId: 'm123',
       text: 'این دو نفر که مشاهده می کنید ، فضانورد نیستن ، تو بخش کووید هم کار نمیکنن ، برای امتحان حضوری اومدن  🤣 ',
       chatMessageType: MessageType.text,
       chatMessageStatus: MessageStatus.viewed,
       isSender: false,
       owner: 'محمد رضا حسینی ',
       ownerPhoto: 'images/ownerImage.png',
       dataTime: DateTime.now().toString() ),

   ChatMessage(
       id: 'm126',
       repliedToId: '',
       text: 'این دو نفر که مشاهده می کنید ، فضانورد نیستن ، تو بخش کووید هم کار نمیکنن ، برای امتحان حضوری اومدن  🤣 ',
       chatMessageType: MessageType.text,
       chatMessageStatus: MessageStatus.delivered ,
       isSender: true,
       owner: '',
       ownerPhoto: '',
       dataTime: DateTime.now().toString() ),

   ChatMessage(
       id: 'm126',
       repliedToId: '',
       text: 'این دو نفر که مشاهده می کنید ، فضانورد نیستن ، تو بخش کووید هم کار نمیکنن ، برای امتحان حضوری اومدن  🤣 ',
       chatMessageType: MessageType.text,
       chatMessageStatus: MessageStatus.delivered ,
       isSender: true,
       owner: '',
       ownerPhoto: '',
       dataTime: DateTime.now().toString() ),

   ChatMessage(
       id: 'm126',
       repliedToId: '',
       text: '',
       chatMessageType: MessageType.document,
       chatMessageStatus: MessageStatus.sent ,
       isSender: true,
       owner: '',
       ownerPhoto: '',
       dataTime: DateTime.now().toString() ),


 ];




}