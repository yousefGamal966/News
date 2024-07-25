import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/SearchProvider.dart';
import 'package:news/di/di.dart';


import 'package:news/ui/home/HomeScreen.dart';
import 'package:news/ui/home/news/NewsListViewModel.dart';
import 'package:provider/provider.dart';

import '../../../data/model/sourcesResponse/Source.dart';
import 'NewsWidget.dart';

class NewsListWidget extends StatefulWidget {
  Source source;
  NewsListWidget(this.source, {super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  var viewModel = getIt.get<NewsListViewModel>();
  var searchController = SearchProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadNews(
        widget.source.id ?? '', searchController.searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    searchController = searchProvider;
    return BlocBuilder<NewsListViewModel, NewsDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case SuccessState():{
            var newsList =state.newsList;
                  return ListView.builder(itemBuilder: (context, index) {

                    return NewsWidget(newsList![index]);
                  },itemCount: newsList?.length??0,);
          }

          case LoadingState():
            {
              return Column(
                children: [
                  Text(state.message),
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            }
          case ErrorState():
            {
             return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage ?? ""),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.loadNews(widget.source.id ?? '',
                              searchProvider.searchController.text);
                        },
                        child: Text('Try Again'))
                  ],
                ),
              );
            }
        }
      },
    );
    // ChangeNotifierProvider(
    //   create: (context) => viewModel,
    //   child: Consumer<NewsListViewModel>(builder:(context, viewModel, child) {
    //     if(viewModel.showLoading == true){
    //       return Center(child: CircularProgressIndicator(),);
    //     }
    //     else if (viewModel.errorMessage != null){
    //       return Center(
    //                  child: Column(
    //                    children: [
    //                      Text(viewModel.errorMessage??""),
    //                    ElevatedButton(onPressed: (){
    //                      viewModel.getNews(widget.source.id??'', searchProvider.searchController.text);
    //                    }, child: Text('Try Again'))
    //                    ],
    //                  ),
    //                );
    //     }
    //     var newsList = viewModel.newsList;
    //       return ListView.builder(itemBuilder: (context, index) {
    //
    //         return NewsWidget(newsList![index]);
    //       },itemCount: newsList?.length??0,);
    //
    //   },));

    //   FutureBuilder(
    //     future: ApiManager.getNews(widget.source.id,search:searchProvider.searchController.text), builder: (context, snapshot) {
    //
    //     if(snapshot.connectionState == ConnectionState.waiting){
    //     Center(child: CircularProgressIndicator(),);
    //   }
    //   if(snapshot.hasError||snapshot.data?.status =='error'){
    //     return Center(
    //       child: Column(
    //         children: [
    //           Text(snapshot.data?.message??snapshot.error.toString()),
    //         ElevatedButton(onPressed: (){}, child: Text('Try Again'))
    //         ],
    //       ),
    //     );
    //   }
    //     var newsList = snapshot.data?.articles;
    //   return ListView.builder(itemBuilder: (context, index) {
    //
    //     return NewsWidget(newsList![index]);
    //   },itemCount: newsList?.length??0,);
    //
    // },);
  }
}
