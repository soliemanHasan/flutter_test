import 'package:equatable/equatable.dart';

class GetSubCategoryParameters extends Equatable {
  final int ?id;
  
  const GetSubCategoryParameters({required this.id});
  
  Map<String, dynamic> toJson() => {};
  @override
  List<Object?> get props => [id];
}
