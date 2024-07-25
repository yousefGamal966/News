import 'package:injectable/injectable.dart';
import 'package:news/data/dataSourceContract/NewsSourceDataSource.dart';
import 'package:news/repositoryContract/NewsSourceRepository.dart';

import '../model/sourcesResponse/Source.dart';
@Injectable(as:NewsSourceRepository )
class NewsSourceRepositoryImpl extends NewsSourceRepository{
  NewsSourceDataSource onlineDataSource;
  @factoryMethod
  NewsSourceRepositoryImpl(this.onlineDataSource);
  @override
  Future<List<Source>?> getSources(String catId) {
    return onlineDataSource.getSources(catId);
  }
}