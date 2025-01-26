import 'package:flutter/material.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/presentation/views/widgets/edit_pill_view_body.dart';

class EditPillView extends StatelessWidget {
  const EditPillView({super.key, this.pillModel});
  final PillModel? pillModel;
  @override
  Widget build(BuildContext context) {
    return EditPillViewBody(
      pillModel: pillModel,
    );
  }
}
