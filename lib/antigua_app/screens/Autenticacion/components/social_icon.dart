import 'package:emprendej/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocalIcon({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: ColorSecundarioClaro,
          border: Border.all(
            width: 2,
            color: ColorSecundarioClaro,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          color: ColorPrimarioClaro,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
