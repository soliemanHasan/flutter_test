part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonTappedEvent extends RegisterEvent {
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


  const RegisterButtonTappedEvent({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.bankName,
    required this.iban,
    required this.profilePhoto,
    required this.residencyPhotoPath,
    required this.subCategories,
  });


  
   
}

