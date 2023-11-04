import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/newsResponse/News.dart';
import 'package:news/ui/home/newsDetails/NewsDetails.dart';


class NewsWidget extends StatefulWidget {
  News news;
  NewsWidget(this.news,{super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsDetails(widget.news),));
            },

            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child:CachedNetworkImage(
                imageUrl: widget.news.urlToImage??"",
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Text(widget.news.author ??"",
            textAlign: TextAlign.start,),
          Text(widget.news.title??"",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
            ),),
          Text(widget.news.publishedAt??"",
            textAlign: TextAlign.end,),

        ],
      ),
    );
  }
}