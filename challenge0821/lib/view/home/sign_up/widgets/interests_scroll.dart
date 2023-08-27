import 'package:challenge0821/util/size.dart';
import 'package:flutter/material.dart';

class IntersetsScrollView extends StatefulWidget {
  const IntersetsScrollView(
      {super.key, required this.items, required this.text});

  final List<String> items;
  final String text;

  @override
  State<IntersetsScrollView> createState() => _IntersetsScrollViewState();
}

class _IntersetsScrollViewState extends State<IntersetsScrollView> {
  List<String> chooseList = [];

  void updateChoose(String value) {
    setState(() {
      if (chooseList.contains(value)) {
        chooseList.remove(value);
      } else {
        chooseList.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConf = SizeConfig(context);
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: sizeConf.width(16),
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        SizedBox(
          height: sizeConf.width(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: sizeConf.width(600),
                ),
                child: Wrap(
                  runSpacing: sizeConf.width(10),
                  spacing: sizeConf.width(10),
                  direction: Axis.horizontal,
                  children: [
                    for (var item in widget.items)
                      GestureDetector(
                        onTap: () {
                          updateChoose(item);
                        },
                        child: Container(
                          padding: EdgeInsets.all(sizeConf.width(10)),
                          decoration: BoxDecoration(
                            color: chooseList.contains(item)
                                ? const Color(0xff4a98e9)
                                : Colors.white,
                            borderRadius:
                                BorderRadius.circular(sizeConf.width(20)),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Text(
                            item,
                            style: TextStyle(
                              color: chooseList.contains(item)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: sizeConf.width(14),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
