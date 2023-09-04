
import 'package:challenge0828/util/size.dart';
import 'package:flutter/material.dart';

import 'widgets/post.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    super.key,
    required this.size,
  });

  final SizeConfig size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.width(12),
              ),
              child: PostWidget(size: size),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}