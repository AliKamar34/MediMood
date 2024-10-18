import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      color: ColorsAssetData.scaffoldColor,
      shadowColor: ColorsAssetData.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRoutes.kEditNotesView);
        },
        borderRadius: BorderRadius.circular(14),
        child: ListTile(
          title: Text(
            'note 1',
            style: AppTextStyle.styleMedium18(context),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 12),
            child: Text(
              'sub title note',
              style: AppTextStyle.styleRegular18(context),
            ),
          ),
          trailing: Text(
            'date',
            style: AppTextStyle.styleRegular14(context),
          ),
        ),
      ),
    );
  }
}
