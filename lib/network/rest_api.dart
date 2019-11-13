import 'package:flutter/foundation.dart';
import 'package:flutter_solodroid/helper/api_interface.dart';
import 'package:flutter_solodroid/model/categoryModel.dart';
import 'package:flutter_solodroid/model/detailModel.dart';
import 'package:flutter_solodroid/model/videoModel.dart';
import 'package:http/http.dart' as http;


class RestApiProvider {
  Future<VideoModel> getPosts() async {
    final response =
        await http.get(ApiInterface.baseUrl + ApiInterface.getPosts);
    if (response.statusCode == 200) {
      print(response.request.url.toString());
      return compute(videoModelFromJson, response.body);
    } else {
      throw Exception("Failed to get data");
    }
  }

  Future<CategoryModel> getCategory() async {
    final response =
        await http.get(ApiInterface.baseUrl + ApiInterface.getCategoryIndex);
    if (response.statusCode == 200) {
      print(response.request.url.toString());
      return compute(categoryModelFromJson, response.body);
    } else {
      throw Exception("Failed to get data");
    }
  }

  Future<VideoModel> getPostsByCategory(int id) async {
    final response = await http.get(
        ApiInterface.baseUrl + ApiInterface.getCategoryPosts + id.toString());
    if (response.statusCode == 200) {
      print(response.request.url.toString());
      return compute(videoModelFromJson, response.body);
    } else {
      throw Exception("Failed to get data");
    }
  }

  Future<VideoModel> getSearchPosts(String query) async {
    final response = await http
        .get(ApiInterface.baseUrl + ApiInterface.getSearchResult + query);
    if (response.statusCode == 200) {
      print(response.request.url.toString());
      return compute(videoModelFromJson, response.body);
    } else {
      throw Exception("Failed to get data");
    }
  }

  Future<List<DetailVideo>> getVideoDetail(String id) async {
    final response = await http
        .get(ApiInterface.detailVideo + id + '&key=' + ApiInterface.secretApi);
    if (response.statusCode == 200) {
      print(response.request.url.toString());
      return compute(videoDetailListFromJson, response.body);
    } else {
      throw Exception("Failed to get data");
    }
  }
}
