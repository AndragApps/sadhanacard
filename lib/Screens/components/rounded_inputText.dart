import 'package:SadhanaCard_1/Screens/components/textField_Container.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final Color hintColor;
  final IconData icon;
  final Color iconColor;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.iconColor = kGblIconColor,
    this.hintColor = kGblHintColor,
    this.onChanged,
    this.textInputType,
    this.textEditingController,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Container(
        child: TextFormField(
          keyboardType: widget.textInputType,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onChanged,
          decoration: InputDecoration(
            icon: Icon(
              widget.icon,
              color: widget.iconColor,
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: widget.hintColor,
            ),
            border: InputBorder.none,
          ),
          controller: widget.textEditingController,
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
