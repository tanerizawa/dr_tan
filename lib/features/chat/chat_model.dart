class ChatModel {
  final String message;
  final DateTime sentAt;
  final bool isUser;
  ChatModel({
    required this.message,
    required this.sentAt,
    required this.isUser,
  });
}
