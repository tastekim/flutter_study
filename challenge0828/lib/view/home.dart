import 'dart:io';

import 'package:challenge0828/util/size.dart';
import 'package:challenge0828/util/theme_mode.dart';
import 'package:challenge0828/view/notificate_page.dart';
import 'package:challenge0828/view/post_page.dart';
import 'package:challenge0828/view/profile_page.dart';
import 'package:challenge0828/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<File> _images = [];
  final ImagePicker picker = ImagePicker();
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

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    bool? isCamera = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Camera"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("gallery "),
            ),
          ],
        ),
      ),
    );

    if (isCamera == null) return;

    if (isCamera) {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          File file = File(pickedFile.path);
          _images.add(file);
        });
      }
    } else {
      final List<XFile> pickedFile = await picker.pickMultiImage();
      if (pickedFile.isNotEmpty) {
        setState(() {
          for (var f in pickedFile) {
            File file = File(f.path);
            _images.add(file);
          }
        });
      }
    }

    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
  }

  void onDelete(File file) {
    setState(() {
      _images.remove(file);
    });
  }

  /// 게시글 작성 바텀시트
  void onBottomSheet() {
    ChangeThemeMode mode = ChangeThemeMode(ctx: Theme.of(context));
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        SizeConfig size = SizeConfig(context);

        return Scaffold(
          backgroundColor: mode.bgSwitch(),
          extendBody: true,
          appBar: AppBar(
            backgroundColor: mode.bgSwitch(),
            toolbarHeight: size.width(50),
            leadingWidth: size.width(80),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Divider(
                  color: Colors.grey.shade300,
                  height: 1,
                  thickness: 1,
                )),
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
                    color: mode.fontSwitch(),
                  ),
                ),
              ),
            ),
            title: Text(
              'New thread',
              style: TextStyle(
                fontSize: size.width(17),
                fontWeight: FontWeight.bold,
                color: mode.fontSwitch(),
              ),
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IntrinsicHeight(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: size.width(20),
                            horizontal: size.width(20),
                          ),
                          constraints: BoxConstraints(
                            minHeight: size.width(100),
                          ),
                          width: double.maxFinite,
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: size.width(22),
                                        backgroundColor: Colors.amber,
                                      ),
                                      SizedBox(
                                        height: size.width(10),
                                      ),
                                      Expanded(
                                        child: VerticalDivider(
                                          width: 2,
                                          thickness: 2,
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.width(10),
                                      ),
                                      CircleAvatar(
                                        radius: size.width(8),
                                        backgroundColor: Colors.amber,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width(10),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      /// id & timestamp
                                      Row(
                                        children: [
                                          Text(
                                            'pubity',
                                            style: TextStyle(
                                              color: mode.fontSwitch(),
                                              fontSize: size.width(14),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width(3),
                                          ),
                                          FaIcon(
                                            FontAwesomeIcons.circleCheck,
                                            color: mode.fontSwitch(),
                                            size: size.width(12),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: mode.fontSwitch(),
                                          ),
                                          controller: _textEditingController,
                                          focusNode: _focusNode,
                                          onTapOutside: (event) {
                                            _focusNode.unfocus();
                                          },
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              isEmpty = false;
                                            } else {
                                              isEmpty = true;
                                            }
                                            setState(() {});
                                          },
                                          minLines: 1,
                                          maxLines: 200,
                                          cursorColor: Colors.blue,
                                          keyboardType: TextInputType.multiline,
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
                                      SizedBox(
                                        height: size.width(10),
                                      ),
                                      SizedBox(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: _images.map((path) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: size.width(10),
                                                ),
                                                width: size.width(250),
                                                height: size.width(200),
                                                child: Stack(
                                                  children: [
                                                    Image.file(
                                                      path,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Positioned.fill(
                                                      bottom: size.width(160),
                                                      left: size.width(200),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          onDelete(path);
                                                        },
                                                        child: Icon(
                                                          Icons.cancel,
                                                          color: Colors.grey,
                                                          size: size.width(25),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.width(10),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              getImage(ImageSource.camera);
                                            },
                                            child: const FaIcon(
                                                FontAwesomeIcons.paperclip),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: mode.bgSwitch(),
                    ),
                    padding: EdgeInsets.all(size.width(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Anyone can reply',
                          style: TextStyle(color: mode.fontSwitch()),
                        ),
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
    ).whenComplete(() {
      _images = [];
      _textEditingController.clear();
      setState(() {});
    });
  }

  

  @override
  Widget build(BuildContext context) {
    SizeConfig size = SizeConfig(context);
    ChangeThemeMode mode = ChangeThemeMode(ctx: Theme.of(context));

    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        backgroundColor: mode.bgSwitch(),
        body: TabBarView(
          children: [
            PostPage(size: size),
            const SearchPage(),
            PostPage(size: size),
            const NotificatePage(),
            const ProfilePage(),
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
              color: currentPage == 0 ? mode.fontSwitch() : Colors.grey,
              size: size.width(26),
            ),
            FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: currentPage == 1 ? mode.fontSwitch() : Colors.grey,
              size: size.width(26),
            ),
            FaIcon(
              FontAwesomeIcons.instagram,
              color: currentPage == 2 ? mode.fontSwitch() : Colors.grey,
              size: size.width(26),
            ),
            FaIcon(
              FontAwesomeIcons.heart,
              color: currentPage == 3 ? mode.fontSwitch() : Colors.grey,
              size: size.width(26),
            ),
            FaIcon(
              FontAwesomeIcons.user,
              color: currentPage == 4 ? mode.fontSwitch() : Colors.grey,
              size: size.width(26),
            ),
          ],
        ),
      ),
    );
  }
}
