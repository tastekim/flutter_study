import 'package:challenge0821/util/size.dart';
import 'package:challenge0821/view/home/sign_up/screens/password_screen.dart';
import 'package:challenge0821/view/home/sign_up/widgets/check_circle.dart';
import 'package:challenge0821/view/home/widgets/big_button.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SentCodeScreen extends StatefulWidget {
  const SentCodeScreen({super.key, required this.adress});

  final String adress;
  @override
  State<SentCodeScreen> createState() => SentCodeScreenState();
}

class SentCodeScreenState extends State<SentCodeScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GifController gifController = GifController();
  bool isAgree = false;
  bool isComplete = false;

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
        builder: (context) => const PasswordScreen(),
      ),
    );
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
          padding: EdgeInsets.only(
            left: sizeConf.width(32),
            right: sizeConf.width(32),
            // bottom: sizeConf.width(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: sizeConf.width(8),
              ),
              Text(
                'We sent you a code',
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
                'Enter it below to verify\n${widget.adress}',
                style: TextStyle(
                  fontSize: sizeConf.width(14),
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: sizeConf.width(40),
              ),
              Form(
                key: formKey,
                child: PinCodeTextField(
                  appContext: context,

                  length: 6,

                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  // validator: (v) {
                  //   if (v?.length == 6) {
                  //     onComplete(true);
                  //   } else {
                  //     onComplete(false);
                  //   }
                  //   return null;
                  // },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    fieldHeight: 50,
                    fieldWidth: 40,
                    inactiveColor: Colors.grey,
                    activeColor: Colors.grey,
                    selectedColor: Colors.black,
                    // activeFillColor: Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  // enableActiveFill: true,
                  // errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    onComplete(true);
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    setState(() {
                      currentText = value;
                    });
                    if (value.length != 6) {
                      onComplete(false);
                    }
                  },
                ),
              ),
              if (isComplete)
                Center(
                  child: SizedBox(
                    width: sizeConf.width(20),
                    height: sizeConf.width(20),
                    child: const AnimatedCheck(),
                  ),
                ),
              Expanded(
                child: SizedBox(
                  height: sizeConf.width(100),
                ),
              ),
              const Text(
                'Didn\'t receive email?',
                style: TextStyle(
                  color: Color(0xff0bacf4),
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
