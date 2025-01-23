import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/data/repos/note_repo.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit(this.noteRepo) : super(EditNoteInitial());

  final NoteRepo noteRepo;
  editNote(NoteModel note) async {
    emit(EditNoteLoading());
    try {
      await noteRepo.addNote(note);
      emit(EditNoteSuccess());
    } catch (e) {
      emit(EditNoteFailuer(errMessage: e.toString()));
    }
  }
}
