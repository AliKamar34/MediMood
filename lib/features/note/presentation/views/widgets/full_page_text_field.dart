import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';

class CustomFullTextField extends StatelessWidget {
  const CustomFullTextField({
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
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: "Note",
        hintStyle: AppTextStyle.styleRegular18(context),
      ),
      scrollPadding: const EdgeInsets.all(20.0),
      keyboardType: TextInputType.multiline,
      maxLines: 99999,
      autofocus: true,
    );
  }
}
