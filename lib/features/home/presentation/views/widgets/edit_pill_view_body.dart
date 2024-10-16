import 'package:flutter/material.dart';
import 'package:new_app/features/home/presentation/views/widgets/choices_section.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_save_button.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_text_field.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_time_picker.dart';
import 'package:new_app/features/home/presentation/views/widgets/edit_pill_app_bar.dart';

class EditPillViewBody extends StatelessWidget {
  const EditPillViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              EditPillAppBar(),
              SizedBox(
                height: 20,
              ),
              CustomTextField(),
              SizedBox(
                height: 20,
              ),
              ChoicesSection(),
              SizedBox(height: 50),
              CustomTimePicker(),
              Expanded(child: SizedBox()),
              CustomSaveButton(),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
