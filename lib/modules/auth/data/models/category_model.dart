import 'package:base_project_v2/core/models/base_model.dart';
import 'package:base_project_v2/modules/auth/domain/entities/category_entity.dart';

class CategoryModel extends BaseModel<CategoriesEntity>{
  List<Data>? data;

  CategoryModel({this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  
  @override
  CategoriesEntity toEntity() {
    // TODO: implement toEntity
   return CategoriesEntity(categoriesEntity: data?.map((e) => e.toEntity()).toList()??[]);
  }
  


}

class Data extends BaseModel<CategoryEntity> {
 final int id;
 final String image;
 final Name name;
  final String postedAt;

  Data({required this.id,required  this.image,required  this.name,required  this.postedAt});

factory  Data.fromJson(Map<String, dynamic> json) {
  return Data(id: json['id'], image: json['image'], name: Name.fromJson(json['name']) , postedAt: json['Posted at']);
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] =id;
    data['image'] = image;
    
      data['name'] = name.toJson();
    
    data['Posted at'] = postedAt;
    return data;
  }
  
  @override
  CategoryEntity toEntity() {
   return CategoryEntity(id: id, name: name.en!);
  }

}

class Name  {
  String? en;
  String? ar;
  String? ur;

  Name({this.en, this.ar, this.ur});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
    ur = json['ur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['en'] = en;
    data['ar'] = ar;
    data['ur'] =ur; 
    return data;
  }
}
