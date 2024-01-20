import 'package:base_project_v2/core/entities/base_entity.dart';

class CategoriesEntity extends BaseEntity{
  final List<CategoryEntity> categoriesEntity;
  CategoriesEntity({required this.categoriesEntity});
   
   factory CategoriesEntity.fromJson(dynamic json){
    return CategoriesEntity(categoriesEntity:json['data']);

   }

   Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data']=categoriesEntity;
  
    return map;

   }
  
  @override
  List<Object?> get props => [categoriesEntity];


}
class CategoryEntity extends BaseEntity{
  final int id;
  final String name;

  CategoryEntity({required this.id, required this.name});
  
  @override
  List<Object?> get props =>[id,name];



}