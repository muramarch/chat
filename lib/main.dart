import 'dart:io';

import 'package:chats/auth/auth_page.dart';
import 'package:chats/screens/message_list_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: "AIzaSyCJWN0CiPgMhLlY1BEwW2sNqrLGTIJxmPs",
            appId: "1:1018909446820:android:42f139496d2965e3d90c31",
            messagingSenderId: "1018909446820",
            projectId: "chats-28d6f",
          ),
        )
      : await Firebase.initializeApp();
  runApp(Chats());
}

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Если пользователь зарегитрирован,
      // то переход на страницу MessageListPage, иначе переход на страницу AuthScreen
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MessageListPage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
