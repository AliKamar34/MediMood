import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorsAssetData.primaryColor,
      decoration: InputDecoration(
        labelText: 'Pill Name',
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
