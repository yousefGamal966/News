import 'package:flutter/material.dart';
import 'package:news/SearchProvider.dart';
import 'package:news/api/ApiManager.dart';
import 'package:news/model/sourcesResponse/Source.dart';
import 'package:news/ui/home/HomeScreen.dart';
import 'package:provider/provider.dart';

import 'NewsWidget.dart';


class NewsListWidget extends StatefulWidget {
  Source source;
   NewsListWidget(this.source,{super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {


    var searchProvider = Provider.of<SearchProvider>(context);
    return FutureBuilder(future: ApiManager.getNews(widget.source.id,search:searchProvider.searchController.text), builder: (context, snapshot) {

        if(snapshot.connectionState == ConnectionState.waiting){
        Center(child: CircularProgressIndicator(),);
      }
      if(snapshot.hasError||snapshot.data?.status =='error'){
        return Center(
          child: Column(
            children: [
              Text(snapshot.data?.message??snapshot.error.toString()),
            ElevatedButton(onPressed: (){}, child: Text('Try Again'))
            ],
          ),
        );
      }
        var newsList = snapshot.data?.articles;
      return ListView.builder(itemBuilder: (context, index) {

        return NewsWidget(newsList![index]);
      },itemCount: newsList?.length??0,);

    },);
  }
}
