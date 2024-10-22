import 'package:dartz/dartz.dart';
import 'package:new_app/core/error/failuer_error.dart';
import 'package:new_app/features/note/data/models/note_model.dart';

abstract class NoteRepo {
  Future<Either<Failure, void>> addNote(NoteModel note);
}
