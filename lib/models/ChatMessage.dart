enum ChatMessageType { text, audio, image, video }

enum MessageStatus { not_Sent, not_view, viewed }

class ChatMessage {
  String text;
  ChatMessageType messageType;
  MessageStatus messageStatus;
  final bool isSender;
  String? imageUrl;

  ChatMessage(
      {required this.text,
      required this.messageType,
      required this.messageStatus,
      required this.isSender,
      this.imageUrl});
}

List demoChatMessages = [
  ChatMessage(
    text: "Hi Vinay!,",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.image,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "Hi, How are you?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Error happened",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_Sent,
    isSender: true,
  ),
  ChatMessage(
    text: "This looks great",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    text: "Glad you like it",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,
    isSender: true,
  ),
];
