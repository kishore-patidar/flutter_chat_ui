class ChatUsers{
  int id;
  String name;
  String messageText;
  String imageURL;
  String time;
  bool isMessageRead;
  bool isOnline;
  ChatUsers({required this.id,required this.name,required this.messageText,required this.imageURL,required this.time,required this.isMessageRead,required this.isOnline});
}