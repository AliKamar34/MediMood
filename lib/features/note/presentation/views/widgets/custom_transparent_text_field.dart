import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';

class CustomTransparentTextField extends StatelessWidget {
  const CustomTransparentTextField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
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
