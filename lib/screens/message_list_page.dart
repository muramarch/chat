import 'package:chats/models/message_model.dart';
import 'package:chats/screens/chat_screen.dart';
import 'package:chats/widgets/textfields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageListPage extends StatefulWidget {
  const MessageListPage({super.key});

  @override
  State<MessageListPage> createState() => _MessageListPageState();
}

class _MessageListPageState extends State<MessageListPage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Чаты',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      icon: Icon(Icons.logout),
                    )
                  ],
                ),
                SizedBox(height: 10),
                SearchTextfield(
                  innerText: 'Поиск',
                  controller: _searchController,
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  Chat chat = chats[index];
                  Message lastMessage = chat.messages.last;
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          User? currentUser = auth.currentUser;
                          if (currentUser != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                  chat: chats[index],
                                  currentUser: currentUser,
                                ),
                              ),
                            );
                          }
                        },
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: Center(
                              child: Text(
                                '${chat.senderName[0]}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          title: Text(
                            chat.senderName,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            lastMessage.content,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(94, 122, 144, 1)),
                          ),
                          trailing: Text(
                            '${lastMessage.timestamp.hour}:${lastMessage.timestamp.minute}',
                            style: TextStyle(
                                color: Color.fromRGBO(94, 122, 144, 1)),
                          ),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
