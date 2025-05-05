import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.items,
    required this.label,
    this.onSaved,
    this.initialValue,
    required this.displayText,
  });
  final List<String> items;
  final String label;
  final void Function(String?)? onSaved;
  final String Function(String?) displayText;

  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyle.styleRegular18(context).copyWith(
          color: ColorsAssetData.primaryColor,
        ),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
      value: initialValue ?? items[0],
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            displayText(value),
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
