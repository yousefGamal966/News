import 'package:injectable/injectable.dart';
import 'package:news/data/api/ApiManager.dart';
import 'package:news/data/dataSourceContract/NewsDataSource.dart';

import '../model/newsResponse/News.dart';
@Injectable(as:  NewsDataSource)
class NewsDataSourceImpl extends NewsDataSource{
  ApiManager apiManager;
  @factoryMethod
  NewsDataSourceImpl(this.apiManager);
  @override
  Future<List<News>?> getNews(String sourceId)async {
    var response = await apiManager.getNews(sourceId);
    return response.articles;
  }
}