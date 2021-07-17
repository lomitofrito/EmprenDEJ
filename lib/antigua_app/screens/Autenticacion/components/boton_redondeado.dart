import 'package:emprendej/shared/constants.dart';
import 'package:flutter/material.dart';

class BotonRedondeado extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color, textColor;
  const BotonRedondeado({
    Key key,
    this.text,
    this.onPressed,
    this.color = ColorPrimarioClaro,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
