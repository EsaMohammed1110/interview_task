import 'package:doodleblue_interview_task/data/Category.dart';
import 'package:doodleblue_interview_task/data/Coordinates.dart';
import 'package:doodleblue_interview_task/data/Location.dart';
class Businesses {
  String? id;
  String? alias;
  String? name;
  String? imageUrl;
  bool? isClosed;
  String? url;
  int? reviewCount;
  List<Categories>? categories;
  double? rating;
  Coordinates? coordinates;
  List<String>? transactions;
  String? price;
  Location? location;
  String? phone;
  String? displayPhone;
  double? distance;

  Businesses(
      {this.id,
        this.alias,
        this.name,
        this.imageUrl,
        this.isClosed,
        this.url,
        this.reviewCount,
        this.categories,
        this.rating,
        this.coordinates,
        this.transactions,
        this.price,
        this.location,
        this.phone,
        this.displayPhone,
        this.distance});

  Businesses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alias = json['alias'];
    name = json['name'];
    imageUrl = json['image_url'];
    isClosed = json['is_closed'];
    url = json['url'];
    reviewCount = json['review_count'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add( Categories.fromJson(v));
      });
    }
    rating = json['rating'];
    coordinates = json['coordinates'] != null
        ?  Coordinates.fromJson(json['coordinates'])
        : null;
    transactions = json['transactions'].cast<String>();
    price = json['price'];
    location = json['location'] != null
        ?  Location.fromJson(json['location'])
        : null;
    phone = json['phone'];
    displayPhone = json['display_phone'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['alias'] = alias;
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['is_closed'] = isClosed;
    data['url'] = url;
    data['review_count'] = reviewCount;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['rating'] = rating;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    data['transactions'] = transactions;
    data['price'] = price;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['phone'] = phone;
    data['display_phone'] = displayPhone;
    data['distance'] = distance;
    return data;
  }
}