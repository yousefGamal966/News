import 'package:injectable/injectable.dart';
import 'package:news/data/api/ApiManager.dart';
import 'package:news/data/dataSourceContract/NewsSourceDataSource.dart';

import '../model/sourcesResponse/Source.dart';
@Injectable(as: NewsSourceDataSource)
class NewsSourceDataSourceImpl extends NewsSourceDataSource {
  ApiManager apiManager;
  @factoryMethod
  NewsSourceDataSourceImpl(this.apiManager);
  @override
  Future<List<Source>?> getSources(String catId)async {
    var response  = await apiManager.getSources(catId);
    return response.sources;

  }
}