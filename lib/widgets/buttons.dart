import 'package:flutter/material.dart';

class TransparentLongBtn extends StatelessWidget {
  final String buttonText;
  final Function buttonFunction;

  const TransparentLongBtn(
      {required this.buttonFunction, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          buttonFunction();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: Color.fromRGBO(60, 237, 120, 1),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
