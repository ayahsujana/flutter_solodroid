import 'package:flutter/material.dart';
import 'package:flutter_solodroid/bloc/bloc.dart';
import 'package:flutter_solodroid/model/categoryModel.dart';
import 'package:flutter_solodroid/widget/widget_getCategoryThumbnail.dart';

class CategoryPosts extends StatefulWidget {
  @override
  _CategoryPostsState createState() => _CategoryPostsState();
}

class _CategoryPostsState extends State<CategoryPosts>
    with AutomaticKeepAliveClientMixin<CategoryPosts> {
  final catPosts = VideoCategoryBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    catPosts.getCategorys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: catPosts.getCategory,
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

            return CategoryListBuilder(snapshot.data);
        }
      },
    );
  }
}

class CategoryListBuilder extends StatelessWidget {
  final CategoryModel items;
  CategoryListBuilder(this.items);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.categories.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, i) {
        var itemPosts = items.categories[i];
        return ItemListCategory(itemPosts);
      },
    );
  }
}
