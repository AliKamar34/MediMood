import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';

class CustomTransparentTextField extends StatelessWidget {
  const CustomTransparentTextField({
    super.key,
    this.onSaved,
    this.initialValue,
  });
  final void Function(String?)? onSaved;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      initialValue:
          initialValue, //if note body isnt null show it but if it null show title
      decoration: InputDecoration(
        hintText: 'Title',
        hintStyle: AppTextStyle.styleMedium18(context),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
