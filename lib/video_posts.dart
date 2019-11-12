import 'package:flutter/material.dart';
import 'package:flutter_solodroid/videoModel.dart';
import 'package:flutter_solodroid/widget_getPostThumbnail.dart';

import 'bloc.dart';

class VideoPosts extends StatefulWidget {
  @override
  _VideoPostsState createState() => _VideoPostsState();
}

class _VideoPostsState extends State<VideoPosts> with AutomaticKeepAliveClientMixin<VideoPosts>{
  final videoPosts = VideoPostsBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    videoPosts.getPostss();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: videoPosts.getPosts,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: Text("Connection Not Found"),
            );
          case ConnectionState.waiting:
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.amber),
            ));

          default:
            if (snapshot.hasError) {
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );
            }

            return PostsListBuilder(snapshot.data);
        }
      },
    );
  }
}

class PostsListBuilder extends StatelessWidget {
  final VideoModel items;
  PostsListBuilder(this.items);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.posts.length,
      itemBuilder: (context, i){
        var itemPosts = items.posts[i];
        return ItemListVideos(itemPosts);
      },
    );
  }
}
