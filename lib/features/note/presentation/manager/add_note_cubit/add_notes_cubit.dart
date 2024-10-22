import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/data/repos/note_repo.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit(this.noteRepo) : super(AddNotesInitial());

  final NoteRepo noteRepo;
  addNote(NoteModel note) async {
    emit(AddNotesLoading());
    try {
      await noteRepo.addNote(note);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailuer(errMessage: e.toString()));
    }
  }
}
