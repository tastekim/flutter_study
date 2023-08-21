import 'package:challenge0821/util/size.dart';
import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConf = SizeConfig(context);
    return Container(
      alignment: Alignment.center,
      width: sizeConf.width(290),
      height: sizeConf.width(50),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: sizeConf.width(15),
          fontWeight: FontWeight.w800,
          letterSpacing: sizeConf.width(-0.5),
        ),
      ),
    );
  }
}