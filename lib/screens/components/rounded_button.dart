import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget{
  final String text;
  final VoidCallback  press;
  final  textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.textColor = Colors.white,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.85,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: TextButton(
          onPressed: press,
          child: Text(text, style: TextStyle(color: Colors.white),),
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey,
            primary: Colors.black26,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          ),
        ),
      ),
    );
  }
}