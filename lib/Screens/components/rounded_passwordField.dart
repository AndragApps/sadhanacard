import 'package:SadhanaCard_1/Screens/components/textField_Container.dart';
import 'package:SadhanaCard_1/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final Color hintColor;
  final IconData icon;
  final Color iconColor;
  final ValueChanged<String> onChange;
  final bool isPasswordHidden;
  final TextInputType textInputType;
  const RoundedPasswordField({
    Key key,
    this.isPasswordHidden = true,
    this.hintText = "Password",
    this.hintColor = kGblHintColor,
    this.icon = Icons.lock,
    this.iconColor = kGblIconColor,
    this.onChange,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: textInputType,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
          ),
          icon: Icon(
            icon,
            color: iconColor,
          ),
          border: InputBorder.none,
        ),
        obscureText: isPasswordHidden,
      ),
    );
  }
}
