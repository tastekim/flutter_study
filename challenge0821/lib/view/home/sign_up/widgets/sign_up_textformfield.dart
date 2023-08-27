import 'package:challenge0821/util/size.dart';
import 'package:flutter/material.dart';

class SignUpTextFormField extends StatefulWidget {
  const SignUpTextFormField({
    super.key,
    required this.text,
    required this.changeState,
  });

  final String text;
  final Function changeState;

  @override
  State<SignUpTextFormField> createState() => _SignUpTextFormFieldState();
}

class _SignUpTextFormFieldState extends State<SignUpTextFormField> {
  final TextEditingController textEditingController = TextEditingController();
  bool _isDefined = false;

  void setNewValue(String newValue) {
    setState(() {
      textEditingController.text = newValue;
    });
  }

  void onChangeValidate(bool isDefined, String value) {
    setState(() {
      _isDefined = isDefined;
      if (widget.text == 'Name') {
        widget.changeState(isDefined, value);
        setState(() {});
      }
      if (widget.text == 'Phone number or email address') {
        widget.changeState(isDefined, value);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConf = SizeConfig(context);
    return TextFormField(
      controller: textEditingController,
      cursorColor: Colors.grey.shade700,
      onChanged: (value) {
        setNewValue(value);
        textEditingController.selection = TextSelection.fromPosition(
            TextPosition(offset: textEditingController.text.length));
        if (value == '') {
          onChangeValidate(false, value);
        } else {
          onChangeValidate(true, value);
        }
      },
      validator: (value) {
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: _isDefined
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : null,
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
    );
  }
}
