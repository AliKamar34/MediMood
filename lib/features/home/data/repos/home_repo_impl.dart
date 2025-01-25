import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:new_app/core/error/failuer_error.dart';
import 'package:new_app/core/utils/constant.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, void>> addPill(PillModel pill) async {
    try {
      var pillsBox = Hive.box<PillModel>(Constant.kPillsBox);
      await pillsBox.add(pill);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
