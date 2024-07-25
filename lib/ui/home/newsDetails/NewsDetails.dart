
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/model/newsResponse/News.dart';

class NewsDetails extends StatelessWidget {
  News news;
  NewsDetails(this.news);

  @override
  Widget build(BuildContext context) {
    print(news.content);
    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: Colors.white,
      body: Column(

        children: [
          SizedBox(height: 20,),
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child:CachedNetworkImage(
              imageUrl: news.urlToImage??"",
              height: 220,
              width: double.infinity,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),

            ),
          ),
          SizedBox(height: 5,),
          Container(
            alignment: Alignment.topLeft,
            child: Text(news.author ??"",
              textAlign: TextAlign.start,style: TextStyle(
                color: Colors.grey
              ),),
          ),
          SizedBox(height: 20,),
          Text(news.title??"",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),

          Container(
            alignment: Alignment.bottomRight,
            child: Text(news.publishedAt??"",
              textAlign: TextAlign.end,style: TextStyle(
                  color: Colors.grey)),

          ),
          SizedBox(height: 40,),
          Text('Description',style: TextStyle(
              fontSize: 15,fontWeight: FontWeight.w500
          )),
          SizedBox(height: 5,),
          Text(news.description??'',style: TextStyle(
              fontSize: 15
          )),
          SizedBox(height: 20,),
          Text('Content',style: TextStyle(
              fontSize: 15,fontWeight: FontWeight.w500
          )),

          SingleChildScrollView(child: Text(news.content??'',maxLines:20 ,)),
              SizedBox(height: 90,),
              InkWell(
                onTap: (){
                  Uri url = Uri.parse(news.url??'');
                  launchUrl(url);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('View Full Article',style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold
                    ),),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              )
        ],

      ),
    );
  }
}
