import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          ColorsAssetData.primaryColor,
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Save',
            style: AppTextStyle.styleMedium14(context).copyWith(
              color: ColorsAssetData.scaffoldColor,
            ),
          ),
        ],
      ),
    );
  }
}
