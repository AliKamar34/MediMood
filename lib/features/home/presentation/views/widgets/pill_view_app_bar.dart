import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';

class PillsViewAppBar extends StatelessWidget {
  const PillsViewAppBar({
    super.key,
    this.pillModel,
  });
  final PillModel? pillModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pills',
            style: AppTextStyle.styleMedium18(context),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context)
                  .push(AppRoutes.kEditPillView, extra: pillModel);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                ColorsAssetData.primaryColor,
              ),
            ),
            child: Text(
              'Add Pill',
              style: AppTextStyle.styleMedium14(context).copyWith(
                color: ColorsAssetData.scaffoldColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
