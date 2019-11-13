import 'dart:convert';

VideoModel videoModelFromJson(String str) => VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
    String status;
    int count;
    int countTotal;
    int pages;
    List<Post> posts;

    VideoModel({
        this.status,
        this.count,
        this.countTotal,
        this.pages,
        this.posts,
    });

    factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        status: json["status"],
        count: json["count"],
        countTotal: json["count_total"],
        pages: json["pages"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "count_total": countTotal,
        "pages": pages,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    };
}

class Post {
    int vid;
    int catId;
    String videoTitle;
    String videoUrl;
    String videoId;
    String videoThumbnail;
    String videoDuration;
    String videoDescription;
    String videoType;
    String size;
    int totalViews;
    DateTime dateTime;
    String categoryName;

    Post({
        this.vid,
        this.catId,
        this.videoTitle,
        this.videoUrl,
        this.videoId,
        this.videoThumbnail,
        this.videoDuration,
        this.videoDescription,
        this.videoType,
        this.size,
        this.totalViews,
        this.dateTime,
        this.categoryName,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        vid: json["vid"],
        catId: json["cat_id"],
        videoTitle: json["video_title"],
        videoUrl: json["video_url"],
        videoId: json["video_id"],
        videoThumbnail: json["video_thumbnail"],
        videoDuration: json["video_duration"],
        videoDescription: json["video_description"],
        videoType: json["video_type"],
        size: json["size"],
        totalViews: json["total_views"],
        dateTime: DateTime.parse(json["date_time"]),
        categoryName: json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "vid": vid,
        "cat_id": catId,
        "video_title": videoTitle,
        "video_url": videoUrl,
        "video_id": videoId,
        "video_thumbnail": videoThumbnail,
        "video_duration": videoDuration,
        "video_description": videoDescription,
        "video_type": videoType,
        "size": size,
        "total_views": totalViews,
        "date_time": dateTime.toIso8601String(),
        "category_name": categoryName,
    };
}
