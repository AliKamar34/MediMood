import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        hintText: AppLocalizations.of(context)!.notes,
        hintStyle: AppTextStyle.styleRegular18(context),
      ),
      scrollPadding: const EdgeInsets.all(20.0),
      keyboardType: TextInputType.multiline,
      maxLines: 99999,
      autofocus: true,
    );
  }
}
