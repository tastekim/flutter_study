import 'package:challenge0821/util/size.dart';
import 'package:flutter/material.dart';

class BirthInputForm extends StatefulWidget {
  const BirthInputForm({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<BirthInputForm> createState() => _BirthInputFormState();
}

class _BirthInputFormState extends State<BirthInputForm> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConf = SizeConfig(context);
    return TextFormField(
      controller: textEditingController,
      cursorColor: Colors.grey.shade700,
      decoration: InputDecoration(
        label: Text(widget.text),
        labelStyle: TextStyle(
          color: Colors.black54,
          fontSize: sizeConf.width(14),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      onTap: () {
        print('dd');
      },
      onTapOutside: (event) {
        print(event);
      },
    );
  }
}
