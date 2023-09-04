import 'package:challenge0828/util/size.dart';
import 'package:challenge0828/view/notificate_page.dart';
import 'package:challenge0828/view/post_page.dart';
import 'package:challenge0828/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool isEmpty = true;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    _textEditingController.text = '';
    _textEditingController.addListener(() {
      if (_textEditingController.text.isEmpty) {
        isEmpty = true;
      } else {
        isEmpty = true;
      }
      setState(() {});
    });
  }

  void onBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        SizeConfig size = SizeConfig(context);

        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            toolbarHeight: size.width(50),
            leadingWidth: size.width(80),
            leading: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: size.width(14),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            title: Text(
              'New thread',
              style: TextStyle(
                fontSize: size.width(17),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: size.width(350),
                    maxHeight: size.width(300),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: size.width(22),
                            backgroundColor: Colors.amber,
                          ),
                          SizedBox(
                            height: size.width(30),
                            child: VerticalDivider(
                              width: 1,
                              thickness: 2,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width(10),
                      ),
                      SizedBox(
                        width: size.width(280),
                        // height: size.width(100),
                        child: SingleChildScrollView(
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              /// id & timestamp
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'pubity',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: size.width(14),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width(3),
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.circleCheck,
                                        size: size.width(12),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   height: size.width(5),
                              // ),
                              /// contents
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      controller: _textEditingController,
                                      focusNode: _focusNode,
                                      onTapOutside: (event) {
                                        _focusNode.unfocus();
                                      },
                                      validator: (value) {
                                        if (value!.isNotEmpty) {
                                          isEmpty = false;
                                        } else {
                                          isEmpty = true;
                                        }
                                        setState(() {});
                                        return;
                                      },
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          isEmpty = false;
                                        } else {
                                          isEmpty = true;
                                        }
                                        setState(() {});
                                      },
                                      maxLines: 100,
                                      cursorColor: Colors.blue,
                                      decoration: const InputDecoration(
                                        hintText: 'Start a thread...',
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.white,
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.width(16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(size.width(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Anyone can reply'),
                        Text(
                          'Post',
                          style: TextStyle(
                            color: isEmpty ? Colors.grey : Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig size = SizeConfig(context);
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            PostPage(size: size),
            const SearchPage(),
            PostPage(size: size),
            const NotificatePage(),
            PostPage(size: size),
          ],
        ),
        bottomNavigationBar: TabBar(
          padding: EdgeInsets.all(size.width(30)),
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          labelColor: Colors.transparent,
          splashBorderRadius: BorderRadius.circular(30),
          splashFactory: NoSplash.splashFactory,
          indicator: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          onTap: (index) {
            if (index == 2) {
              onBottomSheet();
            }
            currentPage = index;
            setState(() {});
          },
          tabs: [
            FaIcon(
              FontAwesomeIcons.house,
              color: currentPage == 0 ? Colors.black : Colors.grey,
              size: size.width(26),
            ),
            FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: currentPage == 1 ? Colors.black : Colors.grey,
              size: size.width(26),
            ),
            FaIcon(
              FontAwesomeIcons.instagram,
              color: currentPage == 2 ? Colors.black : Colors.grey,
              size: size.width(26),
            ),
            FaIcon(
              FontAwesomeIcons.heart,
              color: currentPage == 3 ? Colors.black : Colors.grey,
              size: size.width(26),
            ),
            FaIcon(
              FontAwesomeIcons.user,
              color: currentPage == 4 ? Colors.black : Colors.grey,
              size: size.width(26),
            ),
          ],
        ),
      ),
    );
  }
}
