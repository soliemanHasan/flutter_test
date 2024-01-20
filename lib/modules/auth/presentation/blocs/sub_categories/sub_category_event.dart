part of 'sub_category_bloc.dart';

sealed class SubCategoryEvent extends Equatable {
  const SubCategoryEvent();
  @override
  List<Object> get props => [];
}

class FetchSubCategoryEvent extends SubCategoryEvent {
  final int? id;
  const FetchSubCategoryEvent( this.id);
}

class ShowSubCategoryEvent extends SubCategoryEvent{
  final List<String>? list;
 const ShowSubCategoryEvent(this.list);
}
