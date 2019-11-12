import 'package:flutter_solodroid/categoryModel.dart';
import 'package:flutter_solodroid/rest_api.dart';
import 'package:flutter_solodroid/videoModel.dart';

import 'detailModel.dart';

class Repo {
  final apiInterface = RestApiProvider();

  Future<VideoModel> getPosts() => apiInterface.getPosts();
  Future<CategoryModel> getCategory() => apiInterface.getCategory();
  Future<VideoModel> getPostsByCategory(int id) => apiInterface.getPostsByCategory(id);
  Future<VideoModel> getSearchPosts(String query) => apiInterface.getSearchPosts(query);
  Future<List<DetailVideo>> getVideoDetail(String id) => apiInterface.getVideoDetail(id);
}