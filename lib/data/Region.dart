import 'package:doodleblue_interview_task/data/Coordinates.dart';

class Region {
  Coordinates? center;

  Region({this.center});

  Region.fromJson(Map<String, dynamic> json) {
    center = json['center'] != null
        ?  Coordinates.fromJson(json['center'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (center != null) {
      data['center'] = center!.toJson();
    }
    return data;
  }
}