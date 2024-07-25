

import '../model/sourcesResponse/Source.dart';

abstract class NewsSourceDataSource{
  Future<List<Source>?> getSources(String catId);
}