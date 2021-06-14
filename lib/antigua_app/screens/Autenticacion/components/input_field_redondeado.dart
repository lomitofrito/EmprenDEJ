import 'package:emprendej/screens/Autenticacion/components/text_field_container.dart';
import 'package:emprendej/shared/constants.dart';
import 'package:flutter/material.dart';

class InputFieldRedondeado extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> validator;

  const InputFieldRedondeado({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        cursorColor: ColorPrimarioClaro,
        style: TextStyle(color: ColorPrimarioClaro),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: ColorPrimarioClaro,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black26),
          errorStyle: TextStyle(color: ColorPrimarioClaro),
          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorPrimarioClaro)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
