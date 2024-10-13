import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

class PillsViewAppBar extends StatelessWidget {
  const PillsViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pills',
            style: AppTextStyle.styleRegular20(context),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kEditPillView);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                ColorsAssetData.primaryColor,
              ),
            ),
            child: Text(
              'Add Pill',
              style: AppTextStyle.styleMedium18(context).copyWith(
                color: ColorsAssetData.scaffoldColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
