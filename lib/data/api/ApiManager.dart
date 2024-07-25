import 'dart:convert';

import 'package:http/http.dart'as http
;
import 'package:injectable/injectable.dart';

import '../model/newsResponse/NewsResponse.dart';
import '../model/sourcesResponse/SourcesResponse.dart';

@singleton
class ApiManager{
  static const String baseUrl = 'newsapi.org' ;
  static const String apiKey = 'f149368c236d486ba65bcba2e402b848' ;
   Future<SourcesResponse>getSources(String categoryId)async{

  var uri  =Uri.https(baseUrl,'v2/top-headlines/sources',
  {
    "apiKey":apiKey,
    'category':categoryId
  }
  );
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
   Future<NewsResponse>getNews(String? sourceId,{String? search})async{

    var url = Uri.https(baseUrl,'v2/everything',{
      'apiKey':apiKey,
      'sources':sourceId,
      'q':search
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

}