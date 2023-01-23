import 'dart:convert';
import 'package:flutter/physics.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/Api/Models/AricaleModels/SourcesData.dart';
import 'package:newsapp/Api/Models/SourcesModels/SouceResponce.dart';
class ApiManager {
  static const String BaseURL = 'newsapi.org';
  static const String ThrowURL = '/v2/top-headlines/sources';
  static const String ThrowURL2 = '/v2/everything';
  static const String ApiKey = '873be8fcd14b4ac0a1ad8028eb216c05 ';
  static Future<SouceResponce> GetSources (String category) async{
    Uri url = Uri.https(
      BaseURL ,
      ThrowURL ,
      {
        "apiKey" : ApiKey ,
        "category" : category ,
      }
    );
    var response = await http.get(url);
    return SouceResponce.fromJson(jsonDecode(response.body));
  }
  static Future<SourcesData> GetFullData(String dataSource) async{
    Uri url = Uri.https(
      BaseURL ,
      ThrowURL2 ,
      {
        "apiKey" : ApiKey ,
        'q' : dataSource ,
      }
    );
    var response =  await http.get(url);
    return SourcesData.fromJson(jsonDecode(response.body));
  }
}
