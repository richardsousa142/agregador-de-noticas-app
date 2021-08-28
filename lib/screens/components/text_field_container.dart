import 'package:flutter/material.dart ';
class TextFieldContainer extends StatelessWidget{
  final Widget child;
  const TextFieldContainer({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width*0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
      ),
      child: child,
    );
  }
}