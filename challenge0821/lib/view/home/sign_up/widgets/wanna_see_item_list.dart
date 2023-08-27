import 'package:challenge0821/util/size.dart';
import 'package:flutter/material.dart';

class GridItemList extends StatefulWidget {
  const GridItemList({super.key, required this.updateFunc});

  final Function updateFunc;
  @override
  State<GridItemList> createState() => _GridItemListState();
}

class _GridItemListState extends State<GridItemList> {
  final itemList = [
    'Fashion & beauty',
    'Outdoors',
    'Arts & culture',
    'Animation & comics',
    'Business & finance',
    'Food',
    'Travel',
    'Entertainment',
    'Music',
    'Gaming',
    'IT',
    'TasteKim'
  ];

  List<String> chooseList = [];

  void chooseItem(String item) {
    setState(() {
      if (chooseList.contains(item)) {
        chooseList.remove(item);
        widget.updateFunc(false);
      } else {
        chooseList.add(item);
        widget.updateFunc(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConf = SizeConfig(context);
    return GridView.count(
      padding: EdgeInsets.all(sizeConf.width(10)),
      childAspectRatio: 2,
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: itemList.map(
        (item) {
          return GestureDetector(
            onTap: () {
              chooseItem(item);
            },
            child: Container(
              margin: EdgeInsets.all(sizeConf.width(6)),
              padding: EdgeInsets.all(sizeConf.width(8)),
              width: sizeConf.width(80),
              height: sizeConf.width(100),
              decoration: BoxDecoration(
                color: chooseList.contains(item)
                    ? const Color(0xff4a98e9)
                    : Colors.white,
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  sizeConf.width(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: sizeConf.width(18),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: RichText(
                          maxLines: 2,
                          text: TextSpan(
                            text: item,
                            style: TextStyle(
                              color: chooseList.contains(item)
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: sizeConf.width(13),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
