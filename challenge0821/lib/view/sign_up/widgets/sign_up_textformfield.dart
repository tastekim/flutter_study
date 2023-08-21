import 'package:challenge0821/util/size.dart';
import 'package:flutter/material.dart';

class SignUpTextFormField extends StatelessWidget {
  SignUpTextFormField({
    super.key,
    required this.text,
  });

  final String text;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConf = SizeConfig(context);
    return TextFormField(
      controller: textEditingController,
      cursorColor: Colors.grey.shade700,
      decoration: InputDecoration(
        label: Text(text),
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
    );
  }
}
