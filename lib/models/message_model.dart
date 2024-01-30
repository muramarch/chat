import 'package:chats/models/user_model.dart';

class Chat {
  String senderName;
  String senderId;
  DateTime timestamp;
  List<Message> messages;

  Chat({
    required this.senderName,
    required this.senderId,
    required this.timestamp,
    required this.messages,
  });
}

class Message {
  String content;
  String senderName;
  String senderId;
  DateTime timestamp;

  Message({
    required this.content,
    required this.senderName,
    required this.senderId,
    required this.timestamp,
  });
}

final List<Chat> chats = [
  Chat(
    senderName: victor.name,
    senderId: "1",
    timestamp: DateTime.now().add(Duration(minutes: 9)),
    messages: [
      Message(
        content: "Привет! Как дела?",
        senderName: victor.name,
        senderId: "1",
        timestamp: DateTime.now(),
      ),
    ],
  ),
  Chat(
    senderName: sasha.name,
    senderId: "2",
    timestamp: DateTime.now().add(Duration(minutes: 8)),
    messages: [
      Message(
        content: "Я готов!",
        senderName: sasha.name,
        senderId: "2",
        timestamp: DateTime.now().add(Duration(minutes: 3)),
      ),
    ],
  ),
  Chat(
    senderName: petr.name,
    senderId: "3",
    timestamp: DateTime.now().add(Duration(minutes: 5)),
    messages: [
      Message(
        content: "Я вышел",
        senderName: petr.name,
        senderId: "3",
        timestamp: DateTime.now().add(Duration(minutes: 9)),
      ),
    ],
  ),
  Chat(
    senderName: alina.name,
    senderId: "4",
    timestamp: DateTime.now().add(Duration(minutes: 3)),
    messages: [
      Message(
        content: "Я вышел",
        senderName: alina.name,
        senderId: "4",
        timestamp: DateTime.now().add(Duration(minutes: 4)),
      ),
    ],
  ),
];
