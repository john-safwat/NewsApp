import 'Sources.dart';

class SouceResponce {
  SouceResponce({
      this.status, 
      this.sources,
      this.code,
      this.message
  });

  SouceResponce.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message =  json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Sources.fromJson(v));
      });
    }
  }
  String? status;
  String? code;
  String? message;
  List<Sources>? sources;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code']= code ;
    map['message'] = message;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}