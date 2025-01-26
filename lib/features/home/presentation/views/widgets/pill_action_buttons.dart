import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';

class PillActionButtons extends StatelessWidget {
  const PillActionButtons({
    super.key,
    this.pillModel,
  });
  final PillModel? pillModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              ColorsAssetData.primaryColor,
            ),
          ),
          child: Text(
            'Take',
            style: AppTextStyle.styleRegular20(context).copyWith(
              color: ColorsAssetData.scaffoldColor,
            ),
          ),
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
            'Edit',
            style: AppTextStyle.styleRegular20(context).copyWith(
              color: ColorsAssetData.scaffoldColor,
            ),
          ),
        ),
      ],
    );
  }
}
