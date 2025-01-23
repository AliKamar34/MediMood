import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/data/repos/note_repo.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit(this.noteRepo) : super(GetNotesInitial());
  final NoteRepo noteRepo;
  getNotes() {
    emit(GetNotesLoading());
    var result = noteRepo.getNotes();
    result.fold(
      (failuer) {
        emit(GetNotesFailuer(errMessage: failuer.errorMessage));
      },
      (notes) {
        emit(GetNotesSuccess(notes: notes));
      },
    );
  }
}
