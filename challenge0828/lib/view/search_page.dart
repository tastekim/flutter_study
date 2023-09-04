import 'package:challenge0828/util/size.dart';
import 'package:challenge0828/view/widgets/search_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _controller = ScrollController();
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
            CupertinoTextField(
              padding: EdgeInsets.all(size.width(10)),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              placeholder: 'Search',
              prefix: Container(
                padding: EdgeInsets.only(
                  left: size.width(10),
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
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
                    return SearchListTile(
                      size: size,
                      title: 'rjmithun',
                      subtitle: 'Mithun',
                      followers: 26.6,
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
