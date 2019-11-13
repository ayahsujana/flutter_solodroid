
import 'package:flutter_solodroid/model/categoryModel.dart';
import 'package:flutter_solodroid/model/detailModel.dart';
import 'package:flutter_solodroid/model/videoModel.dart';
import 'package:flutter_solodroid/network/rest_api.dart';

class Repo {
  final apiInterface = RestApiProvider();

  Future<VideoModel> getPosts() => apiInterface.getPosts();
  Future<CategoryModel> getCategory() => apiInterface.getCategory();
  Future<VideoModel> getPostsByCategory(int id) => apiInterface.getPostsByCategory(id);
  Future<VideoModel> getSearchPosts(String query) => apiInterface.getSearchPosts(query);
  Future<List<DetailVideo>> getVideoDetail(String id) => apiInterface.getVideoDetail(id);
}