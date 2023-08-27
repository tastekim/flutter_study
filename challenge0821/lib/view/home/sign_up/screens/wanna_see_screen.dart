import 'package:challenge0821/util/size.dart';
import 'package:challenge0821/view/home/sign_up/screens/interests_screen.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

import '../widgets/wanna_see_item_list.dart';

class WantToScreen extends StatefulWidget {
  const WantToScreen({super.key});

  @override
  State<WantToScreen> createState() => WantToScreenState();
}

class WantToScreenState extends State<WantToScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GifController gifController = GifController();
  bool isAgree = false;
  bool isComplete = false;
  bool isVisibility = false;
  int chooseCount = 0;

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
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  void updateCount(bool value) {
    setState(() {
      if (value) {
        chooseCount++;
      } else {
        chooseCount--;
      }
    });
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
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        title: Image.asset(
          'assets/images/twitter.png',
          width: sizeConf.width(40),
          height: sizeConf.width(40),
        ),
      ),
      extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
                    'What do you want to see on Twitter?',
                    style: TextStyle(
                      fontSize: sizeConf.width(26),
                      height: sizeConf.width(1.1),
                      fontWeight: FontWeight.w800,
                      letterSpacing: sizeConf.width(-1),
                    ),
                  ),
                  SizedBox(
                    height: sizeConf.width(8),
                  ),
                  Text(
                    'Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.',
                    style: TextStyle(
                      fontSize: sizeConf.width(13),
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: sizeConf.width(10),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
            ),

            /// item list
            Expanded(
              child: GridItemList(updateFunc: updateCount),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: sizeConf.width(32),
            right: sizeConf.width(32),
            bottom: sizeConf.width(20),
            top: sizeConf.width(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(chooseCount < 3
                  ? '$chooseCount of 3 selected'
                  : 'Great work 🎉'),
              GestureDetector(
                onTap: () {
                  if (chooseCount >= 3) {
                    _onNextTap();
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: sizeConf.width(10),
                  ),
                  alignment: Alignment.center,
                  width: sizeConf.width(70),
                  height: sizeConf.width(30),
                  decoration: BoxDecoration(
                    color: chooseCount < 3 ? Colors.grey : Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sizeConf.width(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
