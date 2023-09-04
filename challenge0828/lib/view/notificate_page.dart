import 'package:challenge0828/util/size.dart';
import 'package:challenge0828/view/widgets/notificate_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificatePage extends StatefulWidget {
  const NotificatePage({super.key});

  @override
  State<NotificatePage> createState() => _NotificatePageState();
}

class _NotificatePageState extends State<NotificatePage> {
  final ScrollController _controller = ScrollController();
  int currentTap = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig size = SizeConfig(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: size.width(20),
          right: size.width(20),
          top: size.width(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search',
              style: TextStyle(
                fontSize: size.width(24),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: size.width(10),
            ),
            SizedBox(
              height: size.width(40),
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ListView.separated(
                            controller: _controller,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              String text = '';
                              if (index == 0) text = 'All';
                              if (index == 1) text = 'Replies';
                              if (index == 2) text = 'Mentions';
                              if (index == 3) text = 'Vedio';
                              return GestureDetector(
                                onTap: () {
                                  currentTap = index;
                                  setState(() {});
                                },
                                child: NotificateTabItem(
                                  size: size,
                                  item: text,
                                  selected: currentTap == index,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: size.width(3),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.width(10),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: _controller,
                child: ListView.separated(
                  controller: _controller,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      titleAlignment: ListTileTitleAlignment.top,
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        alignment: Alignment.center,
                        width: size.width(47),
                        height: size.width(47),
                        margin: EdgeInsets.only(
                          bottom: size.width(5),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: size.width(22),
                              backgroundColor: Colors.amber,
                            ),
                            Positioned(
                              top: size.width(24),
                              left: size.width(24),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: size.width(11),
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    radius: size.width(8),
                                    backgroundColor: Colors.black,
                                    child: Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.instagram,
                                        color: Colors.white,
                                        size: size.width(12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(
                            'john_mobbin',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width(14),
                            ),
                          ),
                          SizedBox(
                            width: size.width(3),
                          ),
                          const Text(
                            '4h',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mentioned you',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: size.width(14),
                            ),
                          ),
                          SizedBox(
                            height: size.width(10),
                          ),
                          Text(
                            'Heres a thread you should follow if you love botany @jane_mobbin',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width(14),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

