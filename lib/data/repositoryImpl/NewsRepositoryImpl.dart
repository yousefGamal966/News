import 'package:injectable/injectable.dart';
import 'package:news/data/dataSourceContract/NewsDataSource.dart';
import 'package:news/repositoryContract/NewsRepositoryContract.dart';

import '../model/newsResponse/News.dart';
@Injectable(as: NewsRepositoryContract )
class NewsRepositoryImpl extends NewsRepositoryContract{
  NewsDataSource dataSource;
  @factoryMethod
  NewsRepositoryImpl(this.dataSource);
  @override
  Future<List<News>?> getNews(String sourceId) {
    return dataSource.getNews(sourceId);
  }
}