class ChatMessage{
  int id;
  int userId;
  String messageContent;
  String messageType;
  String time;
  ChatMessage({required this.id,required this.userId,required this.messageContent, required this.messageType, required this.time});
}