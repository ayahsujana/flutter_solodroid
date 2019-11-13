import 'package:flutter_solodroid/model/base_model.dart';
import 'package:flutter_solodroid/network/repo.dart';

abstract class BaseBloc<T extends BaseModel> {
  final repository = Repo();

  dispose() {}
}