import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/presentation/manager/add_pill_cubit/add_pill_cubit.dart';
import 'package:new_app/features/home/presentation/manager/get_pills_cubit/get_pills_cubit.dart';
import 'package:new_app/features/home/presentation/views/widgets/choices_section.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_drop_down.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_save_button.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_text_field.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_time_picker.dart';
import 'package:new_app/features/home/presentation/views/widgets/edit_pill_app_bar.dart';

class EditPillForm extends StatefulWidget {
  const EditPillForm({
    super.key,
    this.pillModel,
  });
  final PillModel? pillModel;
  @override
  State<EditPillForm> createState() => _EditPillFormState();
}

class _EditPillFormState extends State<EditPillForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? pillName, noOfPills, beforeAndAfter, time, period;
  void updateTime(String pickedTime) {
    setState(() {
      time = pickedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const EditPillAppBar(),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              initialValue: widget.pillModel?.pillName,
              onSaved: (value) {
                pillName = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ChoicesSection(
              initialNoOfPills: widget.pillModel?.noOfPills,
              initialBeforeAndAfter: widget.pillModel?.beforeAndAfter,
              savedNoOfPills: (value) {
                noOfPills = value;
              },
              savedBeforeAndAfter: (value) {
                beforeAndAfter = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomDropDown(
              initialValue: widget.pillModel?.period,
              onSaved: (value) {
                period = value;
              },
              label: 'Pills period',
              items: const [
                'BreakFast',
                'Lunch',
                'Dinner',
              ],
            ),
            const Flexible(child: SizedBox(height: 30)),
            CustomTimePicker(
              initialTime: widget.pillModel?.time,
              onTimeSelected: updateTime,
            ),
            const Expanded(flex: 6, child: SizedBox()),
            CustomSaveButton(
              onPressed: () {
                if (formKey.currentState != null) {
                  widget.pillModel?.delete();
                  formKey.currentState!.save();
                  BlocProvider.of<AddPillCubit>(context).addPill(
                    PillModel(
                      pillName: pillName ?? '',
                      noOfPills: noOfPills ?? '',
                      beforeAndAfter: beforeAndAfter ?? '',
                      time: time ?? '',
                      period: period ?? '',
                    ),
                  );
                  BlocProvider.of<GetPillsCubit>(context).getPills();
                  GoRouter.of(context).pop(AppRoutes.kPillsView);
                }
              },
            ),
            const FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
