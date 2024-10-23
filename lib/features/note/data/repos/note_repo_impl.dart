import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:new_app/core/error/failuer_error.dart';
import 'package:new_app/core/utils/constant.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/data/repos/note_repo.dart';

class NoteRepoImpl extends NoteRepo {
  @override
  Future<Either<Failure, void>> addNote(NoteModel note) async {
    try {
      var noteBox = Hive.box<NoteModel>(Constant.kNotesBox);
      await noteBox.add(note);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Either<Failure, List<NoteModel>> getNotes() {
    try {
      var noteBox = Hive.box<NoteModel>(Constant.kNotesBox);
      List<NoteModel> notes = noteBox.values.toList();
      log('message2');
      return right(notes);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
