import '../data/model/newsResponse/News.dart';

abstract class NewsRepositoryContract{
  Future<List<News>?> getNews(String sourceId);
}