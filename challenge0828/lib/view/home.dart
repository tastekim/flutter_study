import 'package:challenge0828/util/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig size = SizeConfig(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/thread_logo.png',
                  width: size.width(70),
                  height: size.width(70),
                ),
              ],
            ),
            SizedBox(
              height: size.width(200),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: size.width(50),
                        height: size.width(50),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: size.width(22),
                              backgroundColor: Colors.amber,
                            ),
                            Positioned(
                              top: size.width(22),
                              left: size.width(24),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: size.width(13),
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    radius: size.width(10),
                                    backgroundColor: Colors.black,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: VerticalDivider(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                  SizedBox(
                    width: size.width(10),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'pubity',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width(14),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Row(
                            children: [
                              Text('2m'),
                              Icon(Icons.more_horiz),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: size.width(60),
        color: Colors.white,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FaIcon(
              FontAwesomeIcons.house,
              color: Colors.grey,
              size: size.width(26),
            ),
            FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.grey,
              size: size.width(26),
            ),
            FaIcon(
              FontAwesomeIcons.instagram,
              color: Colors.grey,
              size: size.width(26),
            ),
            FaIcon(
              FontAwesomeIcons.heart,
              color: Colors.grey,
              size: size.width(26),
            ),
            FaIcon(
              FontAwesomeIcons.user,
              color: Colors.grey,
              size: size.width(26),
            ),
          ],
        ),
      ),
    );
  }
}
