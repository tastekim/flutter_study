import 'package:challenge0828/util/size.dart';
import 'package:challenge0828/util/theme_mode.dart';
import 'package:flutter/material.dart';

class NotificateTabItem extends StatelessWidget {
  const NotificateTabItem({
    super.key,
    required this.size,
    required this.selected,
    required this.item,
  });

  final SizeConfig size;
  final String item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    ChangeThemeMode mode = ChangeThemeMode(ctx: Theme.of(context));

    return Container(
      alignment: Alignment.center,
      width: size.width(100),
      height: size.width(30),
      decoration: BoxDecoration(
          color: selected ? mode.fontSwitch() : mode.bgSwitch(),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        item,
        style: TextStyle(
          color: selected ? mode.bgSwitch() : mode.fontSwitch(),
          fontSize: size.width(16),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
