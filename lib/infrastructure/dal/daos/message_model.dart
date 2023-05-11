class MessageModel {
  final String message;
  final String senderUserName;
  final DateTime sentAt;

  MessageModel({required this.message,
    required this.senderUserName,
    required this.sentAt});

  factory MessageModel.fromJson(Map<String, dynamic> message) {
    return MessageModel(
      message: message['message'],
      senderUserName: message['senderUsername'],
      sentAt: DateTime.fromMillisecondsSinceEpoch(message['sentAt'] * 1000)
    );
  }
}
