import 'package:flutter/material.dart';

import 'package:new_app/features/home/presentation/views/widgets/custom_drop_down.dart';
import 'package:new_app/features/home/presentation/views/widgets/custom_text_field.dart';
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
              Row(
                children: [
                  Expanded(
                    child: CustomDropDown(
                      label: 'No Of Pills',
                      items: [
                        '1 pill',
                        '2 pills',
                        '3 pills',
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: CustomDropDown(
                      label: 'Before & After',
                      items: [
                        'Before Food',
                        'After Food',
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
