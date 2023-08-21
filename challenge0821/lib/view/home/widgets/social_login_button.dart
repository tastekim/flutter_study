import 'package:challenge0821/util/size.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.text,
    required this.logo,
  });

  final String text, logo;

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConf = SizeConfig(context);
    return Container(
      width: sizeConf.width(290),
      height: sizeConf.width(50),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            logo,
            width: sizeConf.width(20),
            height: sizeConf.width(20),
          ),
          SizedBox(
            width: sizeConf.width(16),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: sizeConf.width(15),
              fontWeight: FontWeight.w800,
              letterSpacing: sizeConf.width(-0.5),
            ),
          ),
        ],
      ),
    );
  }
}
