import 'package:flutter/material.dart';
import 'package:flutter_app/screens/components/text_field_container.dart';
class RoundedInputField extends StatelessWidget{
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final TextEditingController myController;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.iconData,
    required this.onChanged,
    required this.myController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: myController,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            iconData,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}