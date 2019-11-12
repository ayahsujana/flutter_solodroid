import 'package:flutter_solodroid/categoryModel.dart';
import 'package:flutter_solodroid/videoModel.dart';
import 'package:rxdart/rxdart.dart';

import 'base_bloc.dart';
import 'detailModel.dart';

class VideoPostsBloc extends BaseBloc {
  final video = PublishSubject<VideoModel>();

  Observable<VideoModel> get getPosts => video.stream;

  getPostss() async {
    VideoModel videoList = await repository.getPosts();
    video.sink.add(videoList);
  }

  @override
  dispose() {
    video.close();
    super.dispose();
  }
}

class VideoCategoryBloc extends BaseBloc {
  final category = PublishSubject<CategoryModel>();

  Observable<CategoryModel> get getCategory => category.stream;

  getCategorys() async {
    CategoryModel videoList = await repository.getCategory();
    category.sink.add(videoList);
  }

  @override
  dispose() {
    category.close();
    super.dispose();
  }
}

class PostsByCategoryBloc extends BaseBloc {
  final byCategory = PublishSubject<VideoModel>();

  Observable<VideoModel> get getPostsByCategory => byCategory.stream;

  getPostsByCategorys(int id) async {
    VideoModel videoList = await repository.getPostsByCategory(id);
    byCategory.sink.add(videoList);
  }

  @override
  dispose() {
    byCategory.close();
    super.dispose();
  }
}

class SearchPostsBloc extends BaseBloc {
  final search = PublishSubject<VideoModel>();

  Observable<VideoModel> get getSearchPosts => search.stream;

  getSearchPostss(String query) async {
    VideoModel videoList = await repository.getSearchPosts(query);
    search.sink.add(videoList);
  }

  @override
  dispose() {
    search.close();
    super.dispose();
  }
}

class DetailPostsBloc extends BaseBloc {
  final detail = PublishSubject<List<DetailVideo>>();

  Observable<List<DetailVideo>> get getDetailPosts => detail.stream;

  getDetailPostss(String id) async {
    List<DetailVideo> videoList = await repository.getVideoDetail(id);
    detail.sink.add(videoList);
  }

  @override
  dispose() {
    detail.close();
    return super.dispose();
  }
}
