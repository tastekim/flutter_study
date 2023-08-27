import 'package:challenge0821/util/size.dart';
import 'package:challenge0821/view/home/widgets/big_button.dart';
import 'package:flutter/material.dart';

import 'sign_up/screens/account_screen.dart';
import 'widgets/social_login_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void onCreateAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignupView()),
    );
  }

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
      ),
      extendBody: true,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: sizeConf.width(32),
              right: sizeConf.width(32),
              bottom: sizeConf.width(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: sizeConf.width(130),
                ),
                Text(
                  "See what's happening\nin the world right now.",
                  style: TextStyle(
                    fontSize: sizeConf.width(26),
                    fontWeight: FontWeight.w800,
                    letterSpacing: sizeConf.width(-1),
                  ),
                ),
                SizedBox(
                  height: sizeConf.width(130),
                ),
                const HomeButton(
                  text: 'Continue with Google',
                  logo: 'assets/images/google.png',
                ),
                SizedBox(
                  height: sizeConf.width(10),
                ),
                const HomeButton(
                  text: 'Continue with Apple',
                  logo: 'assets/images/apple.png',
                ),
                SizedBox(
                  height: sizeConf.width(10),
                ),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: sizeConf.width(10)),
                      child: const Text('or'),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                SizedBox(
                  height: sizeConf.width(3),
                ),
                GestureDetector(
                  child: const CreateAccountButton(
                    text: 'Create account',
                    color: Colors.black,
                  ),
                  onTap: () => onCreateAccountTap(context),
                ),
                SizedBox(
                  height: sizeConf.width(16),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: 'By signing up, you agree to out ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: sizeConf.width(14),
                      ),
                      children: const [
                        TextSpan(
                          text: 'Terms',
                          style: TextStyle(
                            color: Color(0xff0bacf4),
                          ),
                        ),
                        TextSpan(text: ', '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Color(0xff0bacf4),
                          ),
                        ),
                        TextSpan(text: ', '),
                        TextSpan(text: 'and '),
                        TextSpan(
                          text: 'Cookie Use.',
                          style: TextStyle(
                            color: Color(0xff0bacf4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                      // height: sizeConf.width(34),
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Have an account already? ',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: sizeConf.width(12),
                        ),
                        children: const [
                          TextSpan(
                            text: 'Log in',
                            style: TextStyle(
                              color: Color(0xff0bacf4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
