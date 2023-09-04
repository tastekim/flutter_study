import 'package:challenge0828/util/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.size,
  });

  final SizeConfig size;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: size.width(350),
        maxHeight: size.width(318),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: size.width(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: size.width(14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: VerticalDivider(
                      width: 1,
                      thickness: 2,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: size.width(47),
                    height: size.width(47),
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: size.width(14),
                          left: size.width(16),
                          child: CircleAvatar(
                            radius: size.width(10),
                            backgroundColor: Colors.red,
                          ),
                        ),
                        Positioned(
                          top: size.width(26),
                          right: size.width(26),
                          child: CircleAvatar(
                            radius: size.width(7),
                            backgroundColor: Colors.amber,
                          ),
                        ),
                        Positioned(
                          top: size.width(40),
                          child: CircleAvatar(
                            radius: size.width(6),
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width(10),
            ),
            SizedBox(
              width: size.width(280),
              child: Column(
                children: [
                  /// id & timestamp
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Row(
                        children: [
                          Text(
                            '2m',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: size.width(13),
                            ),
                          ),
                          SizedBox(
                            width: size.width(8),
                          ),
                          const Icon(Icons.more_horiz),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width(5),
                  ),

                  /// contents
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text: 'Drop a comment here to test things out.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width(16),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.network(
                          'https://blog.kakaocdn.net/dn/FBkM4/btrqwtdaPRM/LzI8zXJwYrPMn4h7f9M0V1/img.jpg',
                          width: size.width(270),
                          height: size.width(180),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: size.width(10),
                        ),
                        Image.network(
                          'https://blog.kakaocdn.net/dn/FBkM4/btrqwtdaPRM/LzI8zXJwYrPMn4h7f9M0V1/img.jpg',
                          width: size.width(270),
                          height: size.width(180),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.width(16),
                  ),

                  /// buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const FaIcon(FontAwesomeIcons.heart),
                      SizedBox(
                        width: size.width(12),
                      ),
                      const FaIcon(FontAwesomeIcons.comment),
                      SizedBox(
                        width: size.width(12),
                      ),
                      const FaIcon(FontAwesomeIcons.retweet),
                      SizedBox(
                        width: size.width(12),
                      ),
                      const FaIcon(FontAwesomeIcons.featherPointed),
                    ],
                  ),
                  SizedBox(
                    height: size.width(16),
                  ),

                  /// comment & likes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '2 replies ∙ 4 likes',
                        style: TextStyle(
                          fontSize: size.width(14),
                          color: Colors.grey.shade500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
