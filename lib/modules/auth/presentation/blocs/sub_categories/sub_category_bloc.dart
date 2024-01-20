

import 'dart:async';

import 'package:base_project_v2/core/utils/base_state.dart';
import 'package:base_project_v2/modules/auth/domain/entities/sub_category_entity.dart';
import 'package:base_project_v2/modules/auth/domain/parameters/sub_category_parameters.dart';
import 'package:base_project_v2/modules/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sub_category_event.dart';
class SubCategoryBloc extends Bloc<SubCategoryEvent, BaseState<SubCategoriesEntity>> {
  final AuthRepository authRepository;

  SubCategoryBloc(this.authRepository)
      : super(const BaseState<SubCategoriesEntity>()) {
    on<FetchSubCategoryEvent>(_getSubCategories);
    //on<ShowSubCategoryEvent>(_showSubCategories);
  }
  FutureOr<void> _getSubCategories(FetchSubCategoryEvent event, emit) async {
    emit(state.loading());
    final result =
        await authRepository.getSubCategory(GetSubCategoryParameters(id: event.id));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
//   Future<Void> _showSubCategories (ShowSubCategoryEvent event,emit)async{
//     emit (state.loading());
//     final result=


//   }
// }
}