import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_solodroid/bloc/bloc.dart';
import 'package:flutter_solodroid/model/detailModel.dart';
import 'package:flutter_solodroid/model/videoModel.dart';
import 'package:youtube_player/youtube_player.dart';

class PostsDetail extends StatefulWidget {
  final Post items;

  const PostsDetail(this.items);
  @override
  _PostsDetailState createState() => _PostsDetailState();
}

class _PostsDetailState extends State<PostsDetail> {
  final detailPosts = DetailPostsBloc();

  @override
  void initState() {
    detailPosts.getDetailPostss(widget.items.videoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: _buildWidgetBody(widget.items),
    );
  }

  Widget _buildWidgetBody(Post items) {
    return StreamBuilder(
      stream: detailPosts.getDetailPosts,
      builder: (context, snapshot) {
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
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return _buildItemsPosts(snapshot.data[index]);
              },
            );
        }
      },
    );
  }

  Widget _buildItemsPosts(DetailVideo items) {
    return Container(
      child: Column(
        children: <Widget>[
          youtubePlayer(),
          textDetailVideo(items),
        ],
      ),
    );
  }

  Widget youtubePlayer() {
    return YoutubePlayer(
      context: context,
      source: widget.items.videoId,
      quality: YoutubeQuality.HD,
      aspectRatio: 16 / 9,
      autoPlay: false,
      reactToOrientationChange: true,
      controlsTimeOut: Duration(seconds: 3),
      playerMode: YoutubePlayerMode.DEFAULT,
      onError: (error) {
        print(error);
      },
      onVideoEnded: () {},
    );
  }

  Widget textDetailVideo(DetailVideo items) {
    String views = viewCount(items.view);
    String likes = thumbUp(items.like);
    String unLikes = thumbDown(items.disLike);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            items.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 16.0, top: 8.0),
          child:
              Text(views + ' views', style: Theme.of(context).textTheme.body2),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buildIconTextCount(Icons.account_circle, "Subscribe", null),
              buildIconTextCount(Icons.thumb_up, likes, null),
              buildIconTextCount(Icons.thumb_down, unLikes, null),
              //buildIconTextCount(Icons.favorite_border, "Favorite", null),
            ],
          ),
        ),
        Divider(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(items.description,
              style: Theme.of(context).textTheme.caption),
        )
      ],
    );
  }

  Widget buildIconTextCount(IconData icon, String text, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Icon(icon, size: 30, color: Colors.grey),
          ),
          Text(text, style: Theme.of(context).textTheme.body2)
        ],
      ),
    );
  }

  String viewCount(String view) {
    int views = int.parse(view);
    String viewStr = views.toString();
    int length = viewStr.length;

    String sign;

    if ((views % 1000) == views) {
      return views.toString();
    }

    for (int i = 3; i < length; i = i + 3) {
      int power = pow(10, i);
      if (length > i && (length - i) <= 3) {
        double f = views / power;
        if (power == pow(10, 3)) {
          sign = "K";
        } else if (power == pow(10, 6)) {
          sign = "M";
        } else if (power == pow(10, 9)) {
          sign = "B";
        }
        return f.round().toString() + sign;
      }
    }
    return views.toString() == null ? '0' : views;
  }

  String thumbDown(String unLike) {
    int thumbDowns = int.parse(unLike);
    String thumbDownStr = thumbDowns.toString();
    int length = thumbDownStr.length;

    String sign;

    if ((thumbDowns % 1000) == thumbDowns) {
      return thumbDowns.toString();
    }

    for (int i = 3; i < length; i = i + 3) {
      int power = pow(10, i);
      if (length > i && (length - i) <= 3) {
        double f = thumbDowns / power;
        if (power == pow(10, 3)) {
          sign = "K";
        } else if (power == pow(10, 6)) {
          sign = "M";
        } else if (power == pow(10, 9)) {
          sign = "B";
        }
        return f.round().toString() + sign;
      }
    }
    return thumbDowns.toString() == null ? '0' : thumbDowns;
  }

  String thumbUp(String likes) {
    int thumbUps = int.parse(likes);
    String thumbUpStr = thumbUps.toString();
    int length = thumbUpStr.length;

    String sign;

    if ((thumbUps % 1000) == thumbUps) {
      return thumbUps.toString();
    }

    for (int i = 3; i < length; i = i + 3) {
      int power = pow(10, i);
      if (length > i && (length - i) <= 3) {
        double f = thumbUps / power;
        if (power == pow(10, 3)) {
          sign = "K";
        } else if (power == pow(10, 6)) {
          sign = "M";
        } else if (power == pow(10, 9)) {
          sign = "B";
        }
        return f.round().toString() + sign;
      }
    }
    return thumbUps.toString() == null ? '0' : thumbUps;
  }
}
