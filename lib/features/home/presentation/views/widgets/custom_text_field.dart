import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
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
      cursorColor: ColorsAssetData.primaryColor,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.pillName,
        labelStyle: AppTextStyle.styleRegular14(context)
            .copyWith(color: ColorsAssetData.primaryColor),
        hoverColor: ColorsAssetData.primaryColor,
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 1,
        style: BorderStyle.solid,
        color: ColorsAssetData.primaryColor,
      ),
    );
  }
}
