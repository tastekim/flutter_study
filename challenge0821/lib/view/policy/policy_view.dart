import 'package:challenge0821/util/size.dart';
import 'package:challenge0821/view/home/widgets/create_account_button.dart';
import 'package:flutter/material.dart';

class PolicyView extends StatefulWidget {
  PolicyView({super.key, required this.onChangeState});

  Function onChangeState;

  @override
  State<PolicyView> createState() => _PolicyViewState();
}

class _PolicyViewState extends State<PolicyView> {
  bool isAgree = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConf = SizeConfig(context);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
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
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: sizeConf.width(20),
            ),
            Text(
              'Customize your\nexperience',
              style: TextStyle(
                fontSize: sizeConf.width(22),
                fontWeight: FontWeight.w800,
                letterSpacing: sizeConf.width(-1),
              ),
            ),
            SizedBox(
              height: sizeConf.width(15),
            ),
            Text(
              'Track where you see Twitter\ncontent across the web',
              style: TextStyle(
                fontSize: sizeConf.width(16),
                fontWeight: FontWeight.w700,
                letterSpacing: sizeConf.width(-1),
              ),
            ),
            SizedBox(
              height: sizeConf.width(15),
            ),
            Row(
              children: [
                Flexible(
                  child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      text:
                          'Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.',
                      style: TextStyle(
                        fontSize: sizeConf.width(14),
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: sizeConf.width(8),
                ),
                Switch(
                  activeColor: Colors.green,
                  thumbColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey;
                    }
                    return Colors.white;
                  }),
                  value: isAgree,
                  onChanged: (value) {
                    print(value);
                    isAgree = value;
                    widget.onChangeState(value);
                    setState(() {});
                  },
                )
              ],
            ),
            SizedBox(
              height: sizeConf.width(25),
            ),
            Flexible(
              child: RichText(
                text: TextSpan(
                  text: 'By signing up, you agree to our ',
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
                    TextSpan(
                      text:
                          'Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy.',
                    ),
                    TextSpan(
                      text: 'Learn more',
                      style: TextStyle(
                        color: Color(0xff0bacf4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: sizeConf.width(220),
            ),
            GestureDetector(
              onTap: () {
                if (isAgree) {
                  Navigator.pop(context);
                }
              },
              child: CreateAccountButton(
                text: 'Next',
                color: isAgree ? Colors.black : Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
