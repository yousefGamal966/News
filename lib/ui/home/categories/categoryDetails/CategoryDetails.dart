import 'package:flutter/material.dart';
import 'package:news/api/ApiManager.dart';

import 'package:news/ui/home/categories/Category.dart';
import 'package:news/ui/home/categories/categoryDetails/SourcesTabsWidget.dart';



class CategoryDetails extends StatelessWidget {
  Category category;
  CategoryDetails(this.category);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManager.getSources(category.id), builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      else if(snapshot.hasError || snapshot.data?.status == 'error'){
        return Center(
          child: Column(
            children: [
              Text(snapshot.data?.message??snapshot.error.toString()),
            ElevatedButton(onPressed: (){}, child: Text('Try Again'))
            ],
          ),
        );
      }
      var sourcesList = snapshot.data?.sources;

      return SourcesTabWidget(sourcesList!);

    },);
  }
}
