import 'package:flutter/material.dart';
import 'package:flutter_app/screens/components/text_field_container.dart';
class RoundedPassField extends StatelessWidget{
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final TextEditingController myController;
  final bool obscureText;
  const RoundedPassField({
    Key? key,
    required this.hintText,
    required this.iconData,
    required this.onChanged,
    required this.myController,
    this.obscureText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: obscureText,
        controller: myController,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            iconData,
          ),
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: Icon(Icons.visibility),
        ),
      ),
    );
  }
}