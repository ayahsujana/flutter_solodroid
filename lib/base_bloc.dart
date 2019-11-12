import 'package:flutter_solodroid/repo.dart';

import 'base_model.dart';

abstract class BaseBloc<T extends BaseModel> {
  final repository = Repo();

  dispose() {}
}