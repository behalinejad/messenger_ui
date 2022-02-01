enum MessageType {text,document,audio,video}
enum MessageStatus {sent,delivered,viewed}


class ChatMessage {

  final String id ;
  final String repliedToId ;
  final String text ;
  final MessageType chatMessageType;
  final MessageStatus chatMessageStatus ;
  final bool isSender ;
  final String owner ;
  final String ownerPhoto ;
  final String  dataTime ;

  ChatMessage({required this.id,required this.repliedToId, required this.text, required this.chatMessageType, required this.chatMessageStatus, required this.isSender, required this.owner, required this.ownerPhoto, required this.dataTime});



}