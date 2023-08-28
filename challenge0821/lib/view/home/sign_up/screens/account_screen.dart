import 'package:challenge0821/util/size.dart';
import 'package:challenge0821/view/home/sign_up/screens/code_screen.dart';
import 'package:challenge0821/view/home/widgets/big_button.dart';
import 'package:challenge0821/view/home/sign_up/screens/policy_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/sign_up_textformfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController textEditingController = TextEditingController();

  DateTime initialDate = DateTime.now();
  bool isFocused = false;
  bool isNameDefined = false;
  bool isContectDefined = false;
  bool isBirthDefined = false;
  bool isPolicyDefined = false;

  String adress = '';
  String name = '';
  String birth = '';

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
    FocusNode().addListener(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _onPolicyTap(Function changeState) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PolicyView(
          onChangeState: changeState,
        ),
      ),
    );
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SentCodeScreen(
          adress: adress,
        ),
      ),
    );
  }

  void onChangeBirthDefined(bool value) {
    setState(() {
      isBirthDefined = value;
    });
  }

  void onChangePolicyDefined(bool value) {
    setState(() {
      isPolicyDefined = value;
    });
  }

  void onChangeNameDefined(bool value, String input) {
    setState(() {
      isNameDefined = value;
      name = input;
    });
  }

  void onChangeAdressDefined(bool value, String input) {
    setState(() {
      isContectDefined = value;
      adress = input;
    });
  }

  void _setTextFieldDate(DateTime date) {
    setState(() {
      final textDate = date.toString().split(" ").first;
      textEditingController.value = TextEditingValue(text: textDate);
      birth = textDate;
    });
  }

  void _showDialog(Widget child) {
    onChangeBirthDefined(true);
    showCupertinoModalPopup<void>(
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: Colors.grey.shade300),
          ),
        ),
        height: SizeConfig(context).width(220),
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

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
              fontSize: sizeConf.width(14),
            ),
          ),
        ),
      ),
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: sizeConf.width(32),
            right: sizeConf.width(32),
            bottom: sizeConf.width(10),
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
                changeState: onChangeNameDefined,
              ),
              SizedBox(
                height: sizeConf.width(20),
              ),
              SignUpTextFormField(
                text: 'Phone number or email address',
                changeState: onChangeAdressDefined,
              ),
              SizedBox(
                height: sizeConf.width(0),
              ),
              // BirthInputForm(
              //   text: 'Date of Birth',
              // ),
              TextFormField(
                controller: textEditingController,
                cursorColor: Colors.grey.shade700,
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: isBirthDefined
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : null,
                  label: const Text('Date of Birth'),
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: sizeConf.width(14),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                onTap: () {
                  // onTapFocus();
                  // FocusScope.of(context).requestFocus(FocusNode());
                  _showDialog(
                    CupertinoDatePicker(
                      maximumDate: initialDate,
                      initialDateTime: initialDate,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (date) {
                        _setTextFieldDate(date);
                      },
                    ),
                  );
                },
              ),
              const Expanded(
                child: SizedBox(
                    // height: sizeConf.width(300),
                    ),
              ),
              if (!isPolicyDefined)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // print(isBirthDefined);
                        // print(isContectDefined);
                        // print(isNameDefined);
                        // print(isPolicyDefined);
                        if (isBirthDefined &&
                            isContectDefined &&
                            isNameDefined) {
                          _onPolicyTap(onChangePolicyDefined);
                        }
                        return;
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: sizeConf.width(10),
                        ),
                        alignment: Alignment.center,
                        width: sizeConf.width(80),
                        height: sizeConf.width(40),
                        decoration: BoxDecoration(
                          color: (isBirthDefined &&
                                  isContectDefined &&
                                  isNameDefined)
                              ? Colors.black
                              : Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: (isBirthDefined &&
                                    isContectDefined &&
                                    isNameDefined)
                                ? Colors.white
                                : Colors.grey.shade300,
                            fontSize: sizeConf.width(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              if (isPolicyDefined)
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      child: RichText(
                        maxLines: 10,
                        text: TextSpan(
                          text: 'By signing up, you agree to the ',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: sizeConf.width(13),
                          ),
                          children: const [
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                color: Color(0xff0bacf4),
                              ),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: Color(0xff0bacf4),
                              ),
                            ),
                            TextSpan(text: ', inculing '),
                            TextSpan(text: 'and '),
                            TextSpan(
                              text: 'Cookie Use.',
                              style: TextStyle(
                                color: Color(0xff0bacf4),
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads.',
                            ),
                            TextSpan(
                              text: 'Learn more',
                              style: TextStyle(
                                color: Color(0xff0bacf4),
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Others will be able to find you by email or phone number, when provided, unless you choose otherwise ',
                            ),
                            TextSpan(
                              text: 'here',
                              style: TextStyle(
                                color: Color(0xff0bacf4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeConf.width(10),
                    ),
                    GestureDetector(
                      onTap: () {
                        _onNextTap();
                      },
                      child: const CreateAccountButton(
                        text: 'Sign up',
                        color: Color(0xff0bacf4),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
