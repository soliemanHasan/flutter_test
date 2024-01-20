
import 'package:base_project_v2/core/entities/base_entity.dart';

abstract class BaseModel<T extends BaseEntity>{
  T toEntity();
}