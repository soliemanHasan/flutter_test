import 'dart:async';

import 'package:base_project_v2/core/utils/base_state.dart';
import 'package:base_project_v2/modules/auth/domain/entities/category_entity.dart';
import 'package:base_project_v2/modules/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, BaseState<CategoriesEntity>> {
  final AuthRepository authRepository;

  CategoryBloc(this.authRepository)
      : super(const BaseState<CategoriesEntity>()) {
    on<FetchCategoryEvent>(_getCategories);
  }
  FutureOr<void> _getCategories(FetchCategoryEvent event, emit) async {
    emit(state.loading());
    final result =
        await authRepository.getCategory();
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}