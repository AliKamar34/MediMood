import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/presentation/manager/get_pills_cubit/get_pills_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          onPressed: () {
            pillModel!.isTaken = true;
            pillModel!.lastTakenTime = DateTime.now();
            pillModel!.save();
            BlocProvider.of<GetPillsCubit>(context).getPills();
            GoRouter.of(context).pop();
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              ColorsAssetData.primaryColor,
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.take,
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
            AppLocalizations.of(context)!.edit,
            style: AppTextStyle.styleRegular20(context).copyWith(
              color: ColorsAssetData.scaffoldColor,
            ),
          ),
        ),
      ],
    );
  }
}
