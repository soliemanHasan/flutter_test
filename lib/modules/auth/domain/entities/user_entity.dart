import 'package:base_project_v2/core/entities/base_entity.dart';

class UserEntity extends BaseEntity{
   String? accessToken;
  final   int id;
  final  String photo;
  final  String name;
  final  String email;
   final String phone;
   final String iban; 
   final String latitude;
   final String longitude;
 //  final List<SubCategory> subCategories;
   UserEntity({
     this.accessToken,
    required this.email,
    required this.iban,
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.phone,
    required this.photo,
  //  required this.subCategories
   });
   factory UserEntity.fromJson(Map<String,dynamic> json){
        return UserEntity(email: json['email' ]!, iban: json['iban']!, id: json['id']!, latitude: json['latitude'], longitude: json['longitude'], name: json['name'], phone: json['phone'], photo: json["photo"]);
   }
    Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email']=email;
    map['iban']=iban;
    map['id']=id;
    map['latitude']=latitude;
    map['longitude']=longitude;
    map['name']=name;
    map['phone']=phone;
    map['photo']=photo;
    return map;
    }
   
     @ override
     List<Object?> get props => [accessToken,id,  phone,name,email,iban,latitude,longitude];

  
  
}