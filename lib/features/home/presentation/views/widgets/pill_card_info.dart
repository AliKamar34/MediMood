import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/assets_data.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/data/repos/home_repo.dart';
import 'package:new_app/features/home/data/repos/home_repo_impl.dart';

class PillCardInfo extends StatelessWidget {
  const PillCardInfo({
    super.key,
    required this.pillModel,
  });
  final PillModel pillModel;
  @override
  Widget build(BuildContext context) {
    HomeRepoImpl().resetPillIfTimePassed(pillModel);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              pillModel.time,
              style: AppTextStyle.styleBold24(context).copyWith(
                color: ColorsAssetData.primaryColor,
              ),
            ),
            const Expanded(child: SizedBox()),
            pillModel.isTaken
                ? const Icon(
                    Icons.done,
                    size: 30,
                    color: ColorsAssetData.primaryColor,
                  )
                : const SizedBox(),
          ],
        ),
        ListTile(
          leading: SvgPicture.asset(AssetsData.pillIcon),
          title: Text(
            pillModel.pillName,
            style: AppTextStyle.styleBold24(context),
          ),
          subtitle: Row(
            children: [
              Text(
                pillModel.noOfPills,
                style: AppTextStyle.styleMedium18(context),
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                pillModel.beforeAndAfter,
                style: AppTextStyle.styleMedium18(context),
              ),
            ],
          ),
        )
      ],
    );
  }
}
