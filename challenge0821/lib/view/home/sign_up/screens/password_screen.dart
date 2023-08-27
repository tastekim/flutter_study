import 'package:challenge0821/util/size.dart';
import 'package:challenge0821/view/home/sign_up/screens/wanna_see_screen.dart';
import 'package:challenge0821/view/home/sign_up/widgets/check_circle.dart';
import 'package:challenge0821/view/home/widgets/big_button.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => PasswordScreenState();
}

class PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GifController gifController = GifController();
  bool isAgree = false;
  bool isComplete = false;
  bool isVisibility = false;

  String currentText = '';
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    textEditingController.addListener(() {
      if (textEditingController.text.length < 6) {
        setState(() {
          isComplete = false;
        });
      }
    });
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const WantToScreen(),
      ),
    );
  }

  void setNewValue(String newValue) {
    setState(() {
      textEditingController.text = newValue;
    });
  }

  void changeVisibility(bool value) {
    setState(() {
      isVisibility = value;
    });
  }

  void onComplete(bool value) {
    setState(() {
      isComplete = value;
    });
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: sizeConf.width(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: sizeConf.width(8),
              ),
              Text(
                'You\'ll need a password',
                style: TextStyle(
                  fontSize: sizeConf.width(26),
                  fontWeight: FontWeight.w800,
                  letterSpacing: sizeConf.width(-1),
                ),
              ),
              SizedBox(
                height: sizeConf.width(8),
              ),
              Text(
                'Make sure it\'s 8 characters or more',
                style: TextStyle(
                  fontSize: sizeConf.width(14),
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: sizeConf.width(40),
              ),
              TextFormField(
                obscureText: !isVisibility,
                controller: textEditingController,
                cursorColor: Colors.grey.shade700,
                onChanged: (value) {
                  setNewValue(value);
                  textEditingController.selection = TextSelection.fromPosition(
                    TextPosition(
                      offset: textEditingController.text.length,
                    ),
                  );

                  if (value.length >= 8) {
                    onComplete(true);
                  } else {
                    onComplete(false);
                  }
                },
                decoration: InputDecoration(
                  focusColor: Colors.black87,
                  label: const Text('Password'),
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: sizeConf.width(14),
                  ),
                  suffixIconColor: Colors.transparent,
                  suffix: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          changeVisibility(!isVisibility);
                        },
                        child: !isVisibility
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                                size: sizeConf.width(24),
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.grey,
                                size: sizeConf.width(24),
                              ),
                      ),
                      SizedBox(
                        width: sizeConf.width(5),
                      ),
                      isComplete
                          ? SizedBox(
                              width: sizeConf.width(20),
                              height: sizeConf.width(20),
                              child: const AnimatedCheck(),
                            )
                          : Container(),
                    ],
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
              ),
              const Expanded(
                child: SizedBox(
                    // height: sizeConf.width(100),
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: sizeConf.width(16),
                  bottom: sizeConf.width(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    if (isComplete) {
                      _onNextTap();
                    }
                  },
                  child: CreateAccountButton(
                    text: 'Next',
                    color: isComplete ? Colors.black : Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
