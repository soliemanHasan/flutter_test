import 'package:base_project_v2/core/models/base_model.dart';
import 'package:base_project_v2/modules/auth/domain/entities/user_entity.dart';

class UserModel extends BaseModel<UserEntity> {
  Technician? technician;
  String? accessToken;

  UserModel({this.technician, this.accessToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    technician = json['technician'] != null
        ?  Technician.fromJson(json['technician'])
        : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (technician != null) {
      data['technician'] = technician!.toJson();
    }
    data['access_token'] = accessToken;
    return data;
  }
  
  @override
  UserEntity toEntity() {
   return UserEntity(email: technician!.email!, iban: technician!.iban!, id: technician!.id!, latitude: technician!.latitude!, longitude: technician!.longitude!, name: technician!.name!, phone: technician!.phone!, photo: technician!.photo!);
  }


}

class Technician {
  int? id;
  String? photo;
  String? name;
  String? email;
  String? phone;
  String? iban;
  dynamic isVerify;
  String? status;
  String? latitude;
  String? longitude;
  dynamic language;
  List<SubCategories>? subCategories;
dynamic isBlock;
  dynamic wallet;

  Technician(
      {this.id,
      this.photo,
      this.name,
      this.email,
      this.phone,
      this.iban,
      this.isVerify,
      this.status,
      this.latitude,
      this.longitude,
      this.language,
      this.subCategories,
      this.isBlock,
      this.wallet});

  Technician.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    iban = json['iban'];
    isVerify = json['is_verify'];
    status = json['status'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    language = json['language'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add( SubCategories.fromJson(v));
      });
    }
    isBlock = json['is_block'];
    wallet = json['wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['photo'] = photo;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['iban'] = iban;
    data['is_verify'] = isVerify;
    data['status'] = status;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['language'] = language;
    if (subCategories != null) {
      data['sub_categories'] =
          subCategories!.map((v) => v.toJson()).toList();
    }
    data['is_block'] = isBlock;
    data['wallet'] = wallet;
    return data;
  }
}

class SubCategories {
  int? id;
  String? image;
  Name? name;
  Name? description;
  String? postedAt;

  SubCategories(
      {this.id, this.image, this.name, this.description, this.postedAt});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'] != null ?  Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? Name.fromJson(json['description'])
        : null;
    postedAt = json['Posted at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['Posted at'] = postedAt;
    return data;
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
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['en'] = en;
    data['ar'] = ar;
    data['ur'] = ur;
    return data;
  }
}
