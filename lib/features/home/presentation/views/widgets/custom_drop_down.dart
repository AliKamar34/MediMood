import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: 'Select an option',
        labelStyle: AppTextStyle.styleRegular18(context).copyWith(
          color: ColorsAssetData.primaryColor,
        ),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
      value: 'After Food',
      items: [
        'Before Food',
        'After Food',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: AppTextStyle.styleRegular14(context),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {},
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
