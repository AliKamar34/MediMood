import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';

class EditPillViewBody extends StatelessWidget {
  const EditPillViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
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
                    'pill',
                    style: AppTextStyle.styleMedium18(context).copyWith(
                      color: ColorsAssetData.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
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
            ),
          ],
        ),
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
