import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    String status;
    int count;
    List<Category> categories;

    CategoryModel({
        this.status,
        this.count,
        this.categories,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        count: json["count"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    int cid;
    String categoryName;
    String categoryImage;
    int videoCount;

    Category({
        this.cid,
        this.categoryName,
        this.categoryImage,
        this.videoCount,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        cid: json["cid"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        videoCount: json["video_count"],
    );

    Map<String, dynamic> toJson() => {
        "cid": cid,
        "category_name": categoryName,
        "category_image": categoryImage,
        "video_count": videoCount,
    };
}