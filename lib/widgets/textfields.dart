import 'package:flutter/material.dart';

// Textfield for login
class LoginTextfield extends StatefulWidget {
  final String innerText;
  final TextEditingController controller;
  const LoginTextfield({required this.innerText, required this.controller});

  @override
  State<LoginTextfield> createState() => _LoginTextfieldState();
}

class _LoginTextfieldState extends State<LoginTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Color.fromRGBO(237, 242, 246, 1),
        hintText: widget.innerText,
      ),
    );
  }
}

//Textfield from password

class PasswordTextfield extends StatefulWidget {
  final String innerText;
  final TextEditingController controller;
  const PasswordTextfield({required this.innerText, required this.controller});

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isObscured,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Color.fromRGBO(237, 242, 246, 1),
        hintText: widget.innerText,
      ),
    );
  }
}

//Search textfield
class SearchTextfield extends StatefulWidget {
  final String innerText;
  final TextEditingController controller;
  const SearchTextfield({required this.innerText, required this.controller});

  @override
  State<SearchTextfield> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: ImageIcon(AssetImage('assets/images/search.png')),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Color.fromRGBO(237, 242, 246, 1),
          hintText: widget.innerText,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(157, 183, 203, 1),
          ),
        ),
      ),
    );
  }
}

class MessageTextfield extends StatefulWidget {
  final String innerText;
  final TextEditingController controller;
  const MessageTextfield({required this.innerText, required this.controller});

  @override
  State<MessageTextfield> createState() => _MessageTextfieldState();
}

class _MessageTextfieldState extends State<MessageTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 8.0),
        // contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Color.fromRGBO(237, 242, 246, 1),
        hintText: widget.innerText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(157, 183, 203, 1),
        ),
      ),
    );
  }
}
