import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/presentation/manager/add_note_cubit/add_notes_cubit.dart';
import 'package:new_app/features/note/presentation/views/widgets/custom_transparent_text_field.dart';
import 'package:new_app/features/note/presentation/views/widgets/edit_note_view_app_bar.dart';
import 'package:new_app/features/note/presentation/views/widgets/full_page_text_field.dart';

class EditNoteForm extends StatefulWidget {
  const EditNoteForm({
    super.key,
  });

  @override
  State<EditNoteForm> createState() => _EditNoteFormState();
}

class _EditNoteFormState extends State<EditNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EditNoteViewAppBar(
            onTap: () {
              if (formKey.currentState != null) {
                formKey.currentState!.save();
                BlocProvider.of<AddNotesCubit>(context).addNote(
                  NoteModel(
                    title: title ?? '',
                    content: content ?? '',
                    date: DateTime.now().toString(),
                  ),
                );
              }
            },
          ),
          CustomTransparentTextField(
            onSaved: (value) {
              title = value;
            },
          ),
          CustomFullTextField(
            onSaved: (value) {
              content = value;
            },
          ),
        ],
      ),
    );
  }
}
