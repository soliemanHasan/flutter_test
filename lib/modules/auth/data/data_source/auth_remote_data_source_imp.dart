

import 'package:base_project_v2/core/services/cache_storage_services.dart';
import 'package:base_project_v2/modules/auth/data/models/category_model.dart';
import 'package:base_project_v2/modules/auth/data/models/subcategory_model.dart';
import 'package:base_project_v2/modules/auth/domain/parameters/sub_category_parameters.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/apis_urls.dart';
import '../../../../core/services/api_services.dart';
import '../../../../core/utils/app_response.dart';
import '../../domain/parameters/register_parameters.dart';
import '../models/user_model.dart';
import 'auth_data_source.dart';

class AuthRemoteDataSourceImp extends AuthDataSource {
  

  @override
  Future<UserModel> register(RegisterParameters parameters) async {
    AppResponse response = await ApiServices().post(
      ApisUrls.register,
      data: FormData.fromMap(parameters.toJson()) //parameters.toJson(),
    );
 ///   await CacheStorageServices().setToken(response.data['token']);
    return UserModel.fromJson(response.data);
  }

  @override
  Future<CategoryModel> getCategory() async {
  AppResponse response =await ApiServices().get(
   ApisUrls.getCategories,
  );
  return CategoryModel.fromJson(response.data);

  }

  @override
  Future<SubCategoriesModel> getSubCategory(GetSubCategoryParameters getSubCategoryParameters) async {
   AppResponse response =await  ApiServices().get(
    ApisUrls.getSubCategories(getSubCategoryParameters.id),
   );
   return SubCategoriesModel.fromJson(response.data);
  }
   
  
}
