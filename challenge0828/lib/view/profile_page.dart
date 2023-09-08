import 'package:challenge0828/util/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  void openEndDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig size = SizeConfig(context);

    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width,
      ),
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: FaIcon(
            FontAwesomeIcons.earth,
            size: size.width(24),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FaIcon(
              FontAwesomeIcons.instagram,
              size: size.width(24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                openEndDrawer();
              },
              child: FaIcon(
                FontAwesomeIcons.bars,
                size: size.width(24),
              ),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              // automaticallyImplyLeading: false,
              toolbarHeight: size.width(100),
              expandedHeight: size.width(200),
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(
                  top: size.width(70),
                  left: size.width(20),
                  right: size.width(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     FaIcon(
                    //       FontAwesomeIcons.earth,
                    //       size: size.width(24),
                    //     ),
                    //     SizedBox(
                    //       child: Row(
                    //         children: [
                    //           FaIcon(
                    //             FontAwesomeIcons.instagram,
                    //             size: size.width(24),
                    //           ),
                    //           SizedBox(
                    //             width: size.width(24),
                    //           ),
                    //           FaIcon(
                    //             FontAwesomeIcons.bars,
                    //             size: size.width(24),
                    //           ),
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: size.width(25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jane',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: size.width(24),
                              ),
                            ),
                            SizedBox(
                              height: size.width(10),
                            ),
                            Row(
                              children: [
                                Text(
                                  'jane_mobbin',
                                  style: TextStyle(
                                    fontSize: size.width(14),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width(10),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: size.width(5),
                                    horizontal: size.width(5),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[50],
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    'threads.net',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SliverPersistentHeader(
                pinned: true, delegate: TabBarDelegate()),
            SliverFillRemaining(
              // 탭바 뷰 내부에는 스크롤이 되는 위젯이 들어옴.
              hasScrollBody: true,
              child: TabBarView(
                children: [
                  Container(
                    color: Colors.amber,
                  ),
                  Container(
                    color: Colors.redAccent,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        tabs: [
          Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: const Text(
                "Threads",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.white,
              child: const Text(
                "Replies",
              ),
            ),
          ),
        ],
        indicatorWeight: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
