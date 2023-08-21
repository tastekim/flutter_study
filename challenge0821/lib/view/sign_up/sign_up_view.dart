import 'package:challenge0821/util/size.dart';
import 'package:flutter/material.dart';

import 'widgets/sign_up_textformfield.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConf = SizeConfig(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/twitter.png',
          width: sizeConf.width(40),
          height: sizeConf.width(40),
        ),
        leadingWidth: sizeConf.width(76),
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black87,
              fontSize: sizeConf.width(16),
            ),
          ),
        ),
      ),
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizeConf.width(32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: sizeConf.width(20),
            ),
            Text(
              'Create your account',
              style: TextStyle(
                fontSize: sizeConf.width(22),
                fontWeight: FontWeight.w800,
                letterSpacing: sizeConf.width(-1),
              ),
            ),
            SizedBox(
              height: sizeConf.width(10),
            ),
            SignUpTextFormField(
              text: 'Name',
            ),
            SizedBox(
              height: sizeConf.width(20),
            ),
            SignUpTextFormField(
              text: 'Phone number or email address',
            ),
          ],
        ),
      ),
    );
  }
}
