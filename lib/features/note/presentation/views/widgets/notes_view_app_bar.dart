import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotesViewAppBar extends StatelessWidget {
  const NotesViewAppBar({
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
            AppLocalizations.of(context)!.notes,
            style: AppTextStyle.styleMedium18(context),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kAddNotesView);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                ColorsAssetData.primaryColor,
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.addNote,
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
