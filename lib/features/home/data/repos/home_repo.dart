import 'package:dartz/dartz.dart';
import 'package:new_app/core/error/failuer_error.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, void>> addPill(PillModel pill);
  Future<Either<Failure, void>> deletePill(PillModel pill);

  Either<Failure, List<PillModel>> getPills();
  Either<Failure, List<PillModel>> getPeriodPills(String period);
  void resetPillIfTimePassed(PillModel pill);
}
