import 'package:base_project_v2/core/errors/failure.dart';
import 'package:base_project_v2/modules/auth/domain/entities/category_entity.dart';
import 'package:base_project_v2/modules/auth/domain/entities/sub_category_entity.dart';
import 'package:base_project_v2/modules/auth/domain/entities/user_entity.dart';
import 'package:base_project_v2/modules/auth/domain/parameters/register_parameters.dart';
import 'package:base_project_v2/modules/auth/domain/parameters/sub_category_parameters.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(RegisterParameters parameters);
  Future<Either<Failure, CategoriesEntity>> getCategory();
    Future<Either<Failure, SubCategoriesEntity>> getSubCategory(GetSubCategoryParameters getSubCategoryParameters);


}
