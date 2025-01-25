import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/home/presentation/manager/add_pill_cubit/add_pill_cubit.dart';
import 'package:new_app/features/home/presentation/views/widgets/edit_pill_form.dart';

class EditPillViewBody extends StatelessWidget {
  const EditPillViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AddPillCubit, AddPillState>(
          builder: (context, state) {
            if (state is AddPillLoading) {
              return const CircularProgressIndicator();
            } else if (state is AddPillFailuer) {
              return const Text('error');
            } else {
              return const EditPillForm();
            }
          },
        ),
      ),
    );
  }
}
