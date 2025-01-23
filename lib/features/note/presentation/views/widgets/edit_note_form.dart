import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/presentation/manager/add_note_cubit/add_notes_cubit.dart';
import 'package:new_app/features/note/presentation/manager/edit_note_cubit/edit_note_cubit.dart';
import 'package:new_app/features/note/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:new_app/features/note/presentation/views/widgets/custom_transparent_text_field.dart';
import 'package:new_app/features/note/presentation/views/widgets/add_note_view_app_bar.dart';
import 'package:new_app/features/note/presentation/views/widgets/full_page_text_field.dart';

class EditNoteForm extends StatefulWidget {
  const EditNoteForm({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
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
          AddNoteViewAppBar(
            onTap: () {
              if (formKey.currentState != null) {
                widget.noteModel.delete();
                formKey.currentState!.save();
                BlocProvider.of<EditNoteCubit>(context).editNote(
                  NoteModel(
                    title: title ?? '',
                    content: content ?? '',
                    date: DateFormat('dd/MM/yy').format(DateTime.now()),
                  ),
                );
                BlocProvider.of<GetNotesCubit>(context).getNotes();
                GoRouter.of(context).pop(AppRoutes.kNotesView);
              }
            },
          ),
          CustomTransparentTextField(
            initialValue: widget.noteModel.title,
            onSaved: (value) {
              title = value;
            },
          ),
          CustomFullTextField(
            initialValue: widget.noteModel.content,
            onSaved: (value) {
              content = value;
            },
          ),
        ],
      ),
    );
  }
}
