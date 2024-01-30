import 'package:chats/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:chats/models/message_model.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;

  ChatScreen({required this.chat});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: ImageIcon(
                  AssetImage('assets/images/arrow.png'),
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    '${widget.chat.senderName[0]}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.chat.senderName}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'В сети',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(94, 122, 144, 1)),
                  ),
                ],
              )
            ],
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: widget.chat.messages.length,
              itemBuilder: (context, index) {
                Message message = widget.chat.messages[index];
                return ListTile(
                  title: Container(
                    width: null,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(237, 242, 246, 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.content,
                        ),
                      ],
                    ),
                  ),
                  trailing: Text(
                    '${message.timestamp.hour}:${message.timestamp.minute}',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 40),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(237, 242, 246, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: ImageIcon(AssetImage('assets/images/Attach.png')),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: MessageTextfield(
                    innerText: 'Сообщение',
                    controller: _messageController,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(237, 242, 246, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: ImageIcon(AssetImage('assets/images/Audio.png')),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
