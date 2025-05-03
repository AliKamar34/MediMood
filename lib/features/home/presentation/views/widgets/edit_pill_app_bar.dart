import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditPillAppBar extends StatelessWidget {
  const EditPillAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        GoRouter.of(context).pop();
      },
      style: ButtonStyle(
          padding: WidgetStateProperty.all(
        const EdgeInsets.all(0),
      )),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ColorsAssetData.primaryColor,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            AppLocalizations.of(context)!.edit,
            style: AppTextStyle.styleMedium18(context).copyWith(
              color: ColorsAssetData.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
