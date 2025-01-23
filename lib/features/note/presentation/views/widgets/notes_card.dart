import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/core/utils/colors_asset_data.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/presentation/views/widgets/custom_deleting_alert.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
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
          GoRouter.of(context).push(AppRoutes.kEditNotesView, extra: noteModel);
        },
        onLongPress: () {
          log('djhkgdshjkgdskhjgds');
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return DeletingAlert(
                noteModel: noteModel,
              );
            },
          );
        },
        borderRadius: BorderRadius.circular(14),
        child: ListTile(
          title: Text(
            noteModel.title,
            style: AppTextStyle.styleMedium18(context),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 12),
            child: Text(
              noteModel.content,
              style: AppTextStyle.styleRegular18(context),
            ),
          ),
          trailing: Text(
            noteModel.date,
            style: AppTextStyle.styleRegular14(context),
          ),
        ),
      ),
    );
  }
}
