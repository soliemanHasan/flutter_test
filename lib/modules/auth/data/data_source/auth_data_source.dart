
import 'package:base_project_v2/modules/auth/data/models/category_model.dart';
import 'package:base_project_v2/modules/auth/data/models/subcategory_model.dart';
import 'package:base_project_v2/modules/auth/domain/parameters/sub_category_parameters.dart';

import '../../domain/parameters/register_parameters.dart';
import '../models/user_model.dart';

abstract class AuthDataSource {
Future<UserModel> register(RegisterParameters parameters);
  Future<CategoryModel> getCategory( );
  Future<SubCategoriesModel> getSubCategory(GetSubCategoryParameters getSubCategoryParameters);

}
