import 'package:base_project_v2/core/models/base_model.dart';
import 'package:base_project_v2/modules/auth/domain/entities/sub_category_entity.dart';

class SubCategoriesModel extends BaseModel<SubCategoriesEntity>{
  List<Data>? data;
  String? cost;

  SubCategoriesModel({this.data, this.cost});

  SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['cost'] = this.cost;
    return data;
  }
  
  @override
  SubCategoriesEntity toEntity() {
       return SubCategoriesEntity(subCategories: data!.map((e) => e.toEntity()).toList());
  }

}

class Data extends BaseModel<SubCategoryEntity>{
  int? id;
  String? image;
  Name? name;
  Name? description;
  String? postedAt;

  Data({this.id, this.image, this.name, this.description, this.postedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : null;
    postedAt = json['Posted at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['Posted at'] = this.postedAt;
    return data;
  }
  
  @override
  SubCategoryEntity toEntity() {
   return SubCategoryEntity(id: id!,name: name!.en!);
   }
}

class Name {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    data['ur'] = this.ur;
    return data;
  }
}
