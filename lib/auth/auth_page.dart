import 'package:chats/widgets/buttons.dart';
import 'package:chats/widgets/textfields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text(
                  'Авторизация',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
                ),
                SizedBox(height: 30),
                LoginTextfield(
                    innerText: 'Введите ваш email',
                    controller: _emailController),
                SizedBox(height: 20),
                PasswordTextfield(
                    innerText: 'Введите пароль',
                    controller: _passwordController),
                SizedBox(height: 20),
                TransparentLongBtn(
                    buttonFunction: () {
                      signIn();
                    },
                    buttonText: 'Войти')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
