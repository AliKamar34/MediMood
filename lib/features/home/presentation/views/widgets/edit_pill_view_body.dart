import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/features/home/presentation/views/widgets/edit_pill_app_bar.dart';

class EditPillViewBody extends StatelessWidget {
  const EditPillViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const EditPillAppBar(),
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
