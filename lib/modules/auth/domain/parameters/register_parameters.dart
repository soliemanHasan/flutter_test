import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class RegisterParameters extends Equatable {
  final String name;
  final String password;
  final String email;
  final String phone;
  final String city;
  final double latitude;
  final double longitude;
  final MultipartFile residencyPhotoPath;
  final MultipartFile profilePhoto;

  final String bankName;
  final String iban;
  final List<int> subCategories;


  const RegisterParameters({
    required this.name,
    required this.password,
    required this.phone,
    required this.email,
    required this.bankName,
    required this.city,
    required this.iban,
    required this.latitude,
    required this.longitude,
    required this.profilePhoto,
    required this.residencyPhotoPath,
    required this.subCategories,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "email": email,
        "phone": phone,
        "bank_name": bankName,
        "city": city,
        "iban": iban,
        "latitude": latitude,
        "longitude": longitude,
        "residency_photo": residencyPhotoPath,
        "photo": profilePhoto,
        "sub_categories[0]": subCategories,
      };

  @override
  List<Object> get props => [
        name,
        password,
        phone,
        bankName,
        city,
        iban,
        latitude,
        longitude,
        subCategories,
        profilePhoto,
        residencyPhotoPath,
      ];
}
