import 'package:base_project_v2/modules/auth/data/models/category_model.dart';
import 'package:base_project_v2/modules/auth/data/models/subcategory_model.dart';
import 'package:base_project_v2/modules/auth/data/models/user_model.dart';
import 'package:base_project_v2/modules/auth/domain/entities/category_entity.dart';
import 'package:base_project_v2/modules/auth/domain/entities/sub_category_entity.dart';
import 'package:base_project_v2/modules/auth/domain/parameters/sub_category_parameters.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/parameters/register_parameters.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_data_source.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthDataSource authDataSource;
  AuthRepositoryImp(this.authDataSource);

  @override
  Future<Either<Failure, UserEntity>> register(
      RegisterParameters parameters) async {
    try {
      final UserModel res = await authDataSource.register(parameters);
      final user = res.toEntity();
      return Right(user);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }

  @override
  Future<Either<Failure, CategoriesEntity>> getCategory() async {
    try {
      final CategoryModel categoryModel = await authDataSource.getCategory();
      final category = categoryModel.toEntity();
      return Right(category);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }

  @override
  Future<Either<Failure, SubCategoriesEntity>> getSubCategory(
      GetSubCategoryParameters getSubCategoryParameters) async {
    try {
      final SubCategoriesModel subCategoriesModel =
          await authDataSource.getSubCategory(getSubCategoryParameters);
      final subCategories = subCategoriesModel.toEntity();
      return Right(subCategories);
    } catch (e) {
      return Left(ErrorsHandler.failureThrower(e));
    }
  }
}
