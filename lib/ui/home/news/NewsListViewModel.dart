import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news/data/dataSourceContract/NewsDataSource.dart';
import 'package:news/data/dataSourceImpl/NewsDataSourceImpl.dart';
import 'package:news/data/repositoryImpl/NewsRepositoryImpl.dart';
import 'package:news/repositoryContract/NewsRepositoryContract.dart';


import '../../../data/api/ApiManager.dart';
import '../../../data/model/newsResponse/News.dart';

@injectable
class NewsListViewModel extends Cubit<NewsDetailsState>{
   NewsRepositoryContract newsRepository;
  
  
  @factoryMethod
  NewsListViewModel(this.newsRepository):super(LoadingState('Loading....'));




  void loadNews(String sourceId,String search)async{
    emit(LoadingState('Loading....'));
    try {
      var newsList = await newsRepository.getNews(sourceId);
      emit(SuccessState(newsList));
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }





}
sealed class NewsDetailsState{}
class SuccessState extends NewsDetailsState{
  List<News>?  newsList;
  SuccessState(this.newsList);
}
class LoadingState extends NewsDetailsState{
  String message;
  LoadingState(this.message);

}
class ErrorState extends NewsDetailsState{
  String errorMessage;
  ErrorState(this.errorMessage);
}