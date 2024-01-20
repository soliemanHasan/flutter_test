import 'dart:async';
import 'package:base_project_v2/core/utils/base_state.dart';
import 'package:base_project_v2/modules/auth/domain/entities/user_entity.dart';
import 'package:base_project_v2/modules/auth/domain/parameters/register_parameters.dart';
import 'package:base_project_v2/modules/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, BaseState<UserEntity>> {
  final AuthRepository authRepository;
  RegisterBloc(this.authRepository) : super(const BaseState<UserEntity>()) {
    on<RegisterButtonTappedEvent>(_register);
  }

  FutureOr<void> _register(RegisterButtonTappedEvent event, emit) async {
    emit(state.loading());
    final result = await authRepository.register(RegisterParameters(
      
        name: event.name,
        email: event.email,
        password: event.password,
        phone: event.phone,
        bankName: event.bankName,
        city: event.city,
        iban: event.iban,
        latitude: event.latitude,
        longitude: event.longitude,
      profilePhoto :event.profilePhoto,
       residencyPhotoPath: event.residencyPhotoPath,
        subCategories: event.subCategories));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
