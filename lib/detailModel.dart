import 'dart:convert';

List<DetailVideo> videoDetailListFromJson(String str) {
  var data = jsonDecode(str);
  List items = data["items"];
  return new List<DetailVideo>.from(items.map((x) => DetailVideo.fromJson(x)));
}

class DetailVideo {
  final String publishDate;
  final String channelId;
  final String title;
  final String description;
  final String thumbnail;
  final String channelTitle;
  final String duration;
  final String view;
  final String like;
  final String disLike;
  final String comment;
  bool isExpanded;

  DetailVideo(
      {this.publishDate,
      this.channelId,
      this.title,
      this.description,
      this.thumbnail,
      this.channelTitle,
      this.duration,
      this.view,
      this.like,
      this.disLike,
      this.comment,
      this.isExpanded});

  factory DetailVideo.fromJson(Map<String, dynamic> json) => new DetailVideo(
      //id: int.parse(json["etag"]),
      publishDate: json['snippet']['publishedAt'],
      channelId: json['snippet']['channelId'],
      title: json['snippet']['title'],
      description: json['snippet']['description'],
      thumbnail: json['snippet']['thumbnails']['high']['url'],
      channelTitle: json['snippet']['channelTitle'],
      duration: json['contentDetails']['duration'],
      view: json['statistics']['viewCount']== null
          ? "0": json['statistics']['viewCount'],
      like: json['statistics']['likeCount']== null
          ? "0": json['statistics']['likeCount'],
      disLike: json['statistics']['dislikeCount']== null
          ? "0": json['statistics']['dislikeCount'],
      comment: json['statistics']['commentCount'] == null
          ? "0"
          : json['statistics']['commentCount'],
      isExpanded: false);
}

class AvatarChannel {
  final String url;
  AvatarChannel(this.url);
}