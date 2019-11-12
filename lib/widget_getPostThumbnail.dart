import 'package:flutter/material.dart';
import 'package:flutter_solodroid/posts_detail.dart';
import 'package:flutter_solodroid/videoModel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemListVideos extends StatelessWidget {
  final Post items;
  ItemListVideos(this.items);
  @override
  Widget build(BuildContext context) {
    var videoThumbnail = "https://i.ytimg.com/vi/" + items.videoId + "/hqdefault.jpg";
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PostsDetail(items)
        ));
      },
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 190.0,
                    height: 120.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        imageUrl: videoThumbnail,
                        placeholder: (context, url) => Image.asset('assets/images/loading.gif', fit: BoxFit.cover,),
                        errorWidget: (context, url, error) => Image.network('https://vignette.wikia.nocookie.net/the-weeb-squad/images/c/c9/Error-404.png', fit: BoxFit.cover,),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    height: 40,
                    width: 65,
                    child: Card(
                      margin: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          items.videoDuration,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(items.videoTitle,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subhead),
                    ),
                    Text(
                      items.categoryName,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.amber,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
