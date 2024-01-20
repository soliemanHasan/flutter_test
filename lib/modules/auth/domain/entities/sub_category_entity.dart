import 'package:base_project_v2/core/entities/base_entity.dart';
class SubCategoriesEntity extends BaseEntity{
final List<SubCategoryEntity> subCategories;

SubCategoriesEntity({required this.subCategories});
  @override
  List<Object?> get props => [subCategories];
}





class SubCategoryEntity  extends BaseEntity{
  final int id;
  final String name;
  SubCategoryEntity({required this.id,required this.name});
  
  @override

  List<Object?> get props => [id,name];
  
}

