import 'package:doodleblue_interview_task/data/Business.dart';
import 'package:doodleblue_interview_task/data/Region.dart';

class BusinessResponse {
  List<Businesses>? businesses;
  int? total;
  Region? region;

  BusinessResponse({this.businesses, this.total, this.region});

  BusinessResponse.fromJson(Map<String, dynamic> json) {
    if (json['businesses'] != null) {
      businesses = <Businesses>[];
      json['businesses'].forEach((v) {
        businesses!.add( Businesses.fromJson(v));
      });
    }
    total = json['total'];
    region =
    json['region'] != null ?  Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (businesses != null) {
      data['businesses'] = businesses!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    if (region != null) {
      data['region'] = region!.toJson();
    }
    return data;
  }
}