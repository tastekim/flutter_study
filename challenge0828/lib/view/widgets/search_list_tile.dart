import 'package:challenge0828/util/size.dart';
import 'package:challenge0828/util/theme_mode.dart';
import 'package:flutter/material.dart';

class SearchListTile extends StatelessWidget {
  const SearchListTile({
    super.key,
    required this.size,
    required this.title,
    required this.subtitle,
    required this.followers,
  });

  final SizeConfig size;
  final String title, subtitle;
  final num followers;

  @override
  Widget build(BuildContext context) {
    ChangeThemeMode mode = ChangeThemeMode(ctx: Theme.of(context));

    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      contentPadding: EdgeInsets.zero,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber,
            radius: size.width(20),
          ),
        ],
      ),
      title: Text(
        title,
        style: TextStyle(
          color: mode.fontSwitch(),
          fontSize: size.width(14),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey,
              fontSize: size.width(14),
            ),
          ),
          SizedBox(
            height: size.width(10),
          ),
          Text(
            '${followers}K followers',
            style: TextStyle(
              color: Colors.grey,
              fontSize: size.width(14),
            ),
          ),
        ],
      ),
      trailing: Container(
          padding: EdgeInsets.symmetric(
            vertical: size.width(5),
            horizontal: size.width(20),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            'Follow',
            style: TextStyle(
              fontSize: size.width(16),
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
