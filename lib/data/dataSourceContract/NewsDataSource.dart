import 'package:news/data/model/newsResponse/News.dart';

abstract class NewsDataSource{
  Future<List<News>?> getNews(String sourceId);
}